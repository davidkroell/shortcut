package cache

import (
	"sync"
	"time"
)

type Cache struct {
	mu             sync.Mutex
	items          map[string]item
	maxAccessCount int
}

type item struct {
	data        interface{}
	accessCount int
}

func New(decrInterval time.Duration, maxAccessCount int) *Cache {
	c := Cache{
		items:          map[string]item{},
		maxAccessCount: maxAccessCount,
	}
	go c.manage(decrInterval)
	return &c
}

func (c *Cache) manage(decrInterval time.Duration) {
	t := time.NewTicker(decrInterval)
	for range t.C {
		c.mu.Lock()
		for k, v := range c.items {
			v.accessCount--
			if v.accessCount == 0 {
				c.remove(k)
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
			accessCount: 0,
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
		if val.accessCount < c.maxAccessCount {
			val.accessCount++
			c.items[k] = val
		}
	}
	c.mu.Unlock()

	return val.data, ok
}
