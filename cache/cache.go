package cache

import (
	"sync"
	"time"
)

type Cache struct {
	mu    sync.Mutex
	items map[string]item
	Config
}

type Config struct {
	DecrInterval                     time.Duration
	MaxAccessCount, StartAccessCount uint
}

var DefaultConfig = Config{
	DecrInterval:     time.Minute,
	MaxAccessCount:   30,
	StartAccessCount: 5,
}

type item struct {
	data        interface{}
	accessCount uint
}

func New(conf Config) *Cache {
	c := Cache{
		items:  map[string]item{},
		Config: conf,
	}
	go c.manage()
	return &c
}

func (c *Cache) manage() {
	t := time.NewTicker(c.DecrInterval)
	for range t.C {
		c.mu.Lock()
		for k, v := range c.items {
			if v.accessCount <= 1 {
				c.remove(k)
				continue
			}
			c.items[k] = item{
				data:        v.data,
				accessCount: v.accessCount - 1,
			}
		}
		c.mu.Unlock()
	}
	t.Stop()
}

func (c *Cache) remove(k string) {
	delete(c.items, k)
}

func (c *Cache) Remove(k string) {
	c.mu.Lock()
	c.remove(k)
	c.mu.Unlock()
}

func (c *Cache) Set(k string, v interface{}, force bool) (success bool) {
	c.mu.Lock()

	if _, ok := c.items[k]; (ok && force) || !ok {
		c.items[k] = item{
			data:        v,
			accessCount: c.StartAccessCount,
		}
		c.mu.Unlock()
		return true
	}

	c.mu.Unlock()
	return false
}

func (c *Cache) Get(k string) (v interface{}, found bool) {
	c.mu.Lock()

	val, ok := c.items[k]
	if ok {
		if val.accessCount < c.MaxAccessCount {
			val.accessCount++
			c.items[k] = val
		}
	}
	c.mu.Unlock()

	return val.data, ok
}

func (c *Cache) Flush() {
	c.mu.Lock()
	c.items = map[string]item{}
	c.mu.Unlock()
}
