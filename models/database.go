package models

import (
	"database/sql"
	"errors"
	"fmt"
	"github.com/davidkroell/shortcut/cache"
	_ "github.com/go-sql-driver/mysql"
	"log"
	"sync"
	"time"
)

var db Database
var singleton sync.Once
var c = cache.New(time.Minute, 30)

// ErrNotFound is an error, which is raised if no database entries are found
var ErrNotFound = errors.New("not found")
var ErrCredentialMismatch = errors.New("credentials do not match a user")
var ErrJWT = errors.New("parsing of JWT failed")
var ErrCache = errors.New("error in cache")

type Relateable interface {
	LoadRelated() (err error)
}

// DBModel eases the handling of database-related structs
type DBModel interface {
	Save() (err error)
}

// DBConfig
type DBConfig struct {
	Driver, Username, Password, Host, Name string
}

// Database is a struct wrapper for *sql.DB
type Database struct {
	*sql.DB
}

// Matcher simplifies the handling of similar database queries.
// The different type makes it safe to use this with string formatting to set column and table without prepared statements
type Matcher string

// ColumnMatcher is a more specific Matcher at column-based use-cases
type ColumnMatcher Matcher

const (
	ID              ColumnMatcher = "ID"
	ShortIdentifier ColumnMatcher = "ShortIdentifier"
	Email           ColumnMatcher = "Email"
	TableUsers      Matcher       = "Users"
	TableShortcuts  Matcher       = "Shortcuts"
)

// Makes sure the database is only initialized once
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

const (
	deleteFrom string = `DELETE FROM %s WHERE %s = ? AND UserID = ?;`
)

// DeleteFrom
func DeleteFrom(tm Matcher, cm ColumnMatcher, identifier, userid string) error {
	result, err := db.Exec(fmt.Sprintf(deleteFrom, tm, cm), identifier, userid)

	n, err := result.RowsAffected()
	if n == 0 {
		return ErrNotFound
	} else if n == 1 {
		return nil
	}
	return err
}
