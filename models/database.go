package models

import (
	"database/sql"
	"errors"
	"fmt"
	_ "github.com/go-sql-driver/mysql"
	"log"
	"sync"
	"time"
)

var db Database
var singleton sync.Once

// ErrNotFound is an error, which is raised if no database entries are found
var ErrNotFound = errors.New("not found")

type Relateable interface {
	LoadRelated() (err error)
}

// DBModel eases the handling of database-related structs
type DBModel interface {
	Save() (err error)
	SetID(id string)
}

func setUUIDAsID(m DBModel) error {
	row := db.QueryRow("SELECT UUID();")
	var id string
	if err := row.Scan(&id); err != nil {
		return err
	}
	m.SetID(id)
	return nil
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
	deleteFrom string = `DELETE FROM %s WHERE %s = ?;`
)

// DeleteFrom
func DeleteFrom(tableMatcher Matcher, columnMatcher ColumnMatcher, value string) error {
	_, err := db.Exec(fmt.Sprintf(deleteFrom, tableMatcher, columnMatcher), value)
	return err
}
