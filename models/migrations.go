package models

import (
	"bufio"
	"fmt"
	"io"
	"log"
	"os"
	"path/filepath"
	"time"
)

const (
	createUsersTable string = `CREATE TABLE Users
(
  ID        CHAR(36) PRIMARY KEY,
  Email     CHAR(50)    NOT NULL UNIQUE,
  Firstname VARCHAR(50) NOT NULL,
  Lastname  VARCHAR(50) NOT NULL,
  Password  BINARY(60)  NOT NULL,
  CreatedAt DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UpdatedAt DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  LastLogin DATETIME,
  CHECK (UpdatedAt >= CreatedAt)
)
  ENGINE = InnoDB;`
	dropUsersTable string = `DROP TABLE IF EXISTS Users;`

	createShortcutsTable string = `CREATE TABLE Shortcuts
(
  ID              CHAR(36) PRIMARY KEY,
  ShortIdentifier CHAR(50)      NOT NULL UNIQUE,
  RedirectURL     VARCHAR(1024) NOT NULL,
  RedirectStatus  INT(3)        NOT NULL,
  CreatedAt       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UpdatedAt       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ValidThru       DATETIME      NOT NULL,
  UserID          CHAR(36)      NOT NULL,

  CHECK (ValidThru > CreatedAt),
  CHECK (UpdatedAt >= CreatedAt),

  FOREIGN KEY (UserID) REFERENCES Users (ID)
)
  ENGINE = InnoDB;
`
	dropShortcutsTable string = `DROP TABLE IF EXISTS Shortcuts;`

	createShortcutLogsTable string = `CREATE TABLE ShortcutLog
(
  ShortcutID    CHAR(36),
  IPAddress     VARCHAR(39),
  UserAgent     VARCHAR(100),
  Region        VARCHAR(40),
  AccessedAt    DATETIME DEFAULT CURRENT_TIMESTAMP,

  ResponeStatus INT(3),
  ResponseTime  INT(6),

  FOREIGN KEY (ShortcutID) REFERENCES Shortcuts (ID)
)
  ENGINE = InnoDB;`

	dropShortcutLogTable string = `DROP TABLE IF EXISTS ShortcutLog;`
)

func (db *Database) Migrate(dropTables bool) {
	if dropTables {
		log.Println("Dropping tables")
		if _, err := db.Exec(dropShortcutLogTable); err != nil {
			log.Fatal(err)
		}
		if _, err := db.Exec(dropShortcutsTable); err != nil {
			log.Fatal(err)
		}
		if _, err := db.Exec(dropUsersTable); err != nil {
			log.Fatal(err)
		}
	}

	log.Println("Creating users table")
	if _, err := db.Exec(createUsersTable); err != nil {
		log.Fatal(err)
	}

	log.Println("Created users table")
	log.Println("Creating shortcuts table")
	if _, err := db.Exec(createShortcutsTable); err != nil {
		log.Fatal(err)
	}

	log.Println("Created shortcuts table")
	log.Println("Creating shortcuts log table")
	if _, err := db.Exec(createShortcutLogsTable); err != nil {
		log.Fatal(err)
	}

	log.Println("Created shortcuts log table")
}

func (db *Database) Seed(path string) {
	log.Printf("Seeding database with file %s", path)
	absPath, _ := filepath.Abs(path)

	file, err := os.Open(absPath)
	if err != nil {
		log.Fatal(err)
	}

	closer := make(chan struct{})
	var counter int

	go func() {
		for {
			select {
			case <-time.Tick(500 * time.Millisecond):
				fmt.Print(".")
			case <-closer:
				fmt.Printf("\n")
				log.Printf("Seeding finished. %d SQL statements executed\n", counter)
				return
			}
		}
	}()

	scanner := bufio.NewReader(file)
	for {
		stmt, err := scanner.ReadString(';')
		if err == io.EOF {
			break
		} else if err != nil {
			log.Fatal(err)
		}
		_, err = db.Exec(stmt)
		if err != nil {
			log.Println(err)
		}
		counter++
	}

	closer <- struct{}{}
}
