package models

import (
	"database/sql"
	"errors"
	_ "github.com/go-sql-driver/mysql"
	"log"
	"sync"
	"time"
)

var db Database
var singleton sync.Once

var ErrNotFound = errors.New("not found")

type Relateable interface {
	LoadRelated() (err error)
}

type DBModel interface {
	Save() (err error)
	Delete() (err error)
}

type DBConfig struct {
	Driver, Username, Password, Host, Name string
}

type Database struct {
	*sql.DB
}

type MatchingField string

const (
	ID              MatchingField = "ID"
	ShortIdentifier MatchingField = "ShortIdentifier"
)

func InitDatabase(config DBConfig) *Database {
	// make sure this code only gets executed once
	singleton.Do(func() {
		database, err := sql.Open(config.Driver,
			config.Username+":"+config.Password+"@tcp("+config.Host+")/"+config.Name+"?parseTime=true")
		if err != nil {
			log.Fatal(err)
		}

		// optimize connection pool
		database.SetConnMaxLifetime(time.Minute * 20)
		database.SetMaxOpenConns(10)
		database.SetMaxIdleConns(4)

		// check if database is available
		if err := database.Ping(); err != nil {
			log.Fatal(err)
		}

		db = Database{
			database,
		}
	})

	return &db
}
