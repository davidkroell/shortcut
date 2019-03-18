package cache

import (
	"math"
	"testing"
)

var (
	testByteArray64 = [64]byte{0xde, 0xad, 0xbe, 0xef}
	testByteArray8  = [...]byte{1, 2, 3, 4, 5, 6, 7, 8}
	testByteSlice8  = []byte{1, 2, 3, 4, 5, 6, 7, 8}
)

const (
	testString = "abcdefghijklmnopqrstuvwxyz"
	testInt    = 0xdeadbeef
	testFloat  = float64(math.Pi)
)

type sampleData struct {
	bytes   [64]byte
	boolean bool
	integer int
	decimal float64
}

func BenchmarkCache_SetInt(b *testing.B) {
	c := New(DefaultConfig)

	for i := 0; i < b.N; i++ {
		c.Set(string(b.N), testInt, true)
	}
}

func BenchmarkCache_SetInt64(b *testing.B) {
	c := New(DefaultConfig)

	for i := 0; i < b.N; i++ {
		c.Set(string(b.N), int64(testInt), true)
	}
}

func BenchmarkCache_SetFloat64(b *testing.B) {
	c := New(DefaultConfig)

	for i := 0; i < b.N; i++ {
		c.Set(string(b.N), testFloat, true)
	}
}

func BenchmarkCache_SetString(b *testing.B) {
	c := New(DefaultConfig)

	for i := 0; i < b.N; i++ {
		c.Set(string(b.N), testString, true)
	}
}

func BenchmarkCache_SetByteSlice(b *testing.B) {
	c := New(DefaultConfig)

	for i := 0; i < b.N; i++ {
		c.Set(string(b.N), testByteSlice8, true)
	}
}

func BenchmarkCache_SetByteArray(b *testing.B) {
	c := New(DefaultConfig)

	for i := 0; i < b.N; i++ {
		c.Set(string(b.N), testByteArray8, true)
	}
}

func BenchmarkCache_SetStruct(b *testing.B) {
	c := New(DefaultConfig)

	for i := 0; i < b.N; i++ {
		s := sampleData{
			bytes:   testByteArray64,
			boolean: true,
			integer: testInt,
			decimal: math.Pi,
		}
		c.Set(string(b.N), s, true)
	}
}

func BenchmarkCache_SetStructPointer(b *testing.B) {
	c := New(DefaultConfig)

	for i := 0; i < b.N; i++ {
		s := sampleData{
			bytes:   testByteArray64,
			boolean: true,
			integer: testInt,
			decimal: math.Pi,
		}
		c.Set(string(b.N), &s, true)
	}
}

func BenchmarkCache_Get(b *testing.B) {
	c := New(DefaultConfig)

	s := sampleData{
		bytes:   [64]byte{0xde, 0xad, 0xbe, 0xef},
		boolean: true,
		integer: 0xdeadbeef,
		decimal: math.Pi,
	}
	c.Set("id", s, true)

	for i := 0; i < b.N; i++ {
		_, ok := c.Get("id")
		if !ok {
			b.Fatal("Cache miss")
		}
	}
}
