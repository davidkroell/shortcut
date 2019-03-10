package models

import (
	"log"
	"time"
)

const insertShortcutLog = `INSERT INTO ShortcutLog (ShortcutID, IPAddress, UserAgent, Region, AccessedAt, ResponseTime)
VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, ?);`

var loggerCh = make(chan logEntry)

func init() {
	// spin up 10 db writers
	for i := 1; i < 10; i++ {
		go dbWriter()
	}
}

func dbWriter() {
	for {
		logEntry := <-loggerCh
		if err := logEntry.save(); err != nil {
			log.Println(err)
		}
	}
}

type logEntry struct {
	ShortcutID   string
	IPAddress    string
	UserAgent    string
	Region       string
	AccessedAt   time.Time
	ResponseTime int64
}

func (le *logEntry) save() error {
	result, err := db.Exec(insertShortcutLog, le.ShortcutID, le.IPAddress, le.UserAgent, le.Region, le.ResponseTime)
	if err != nil {
		return err
	}
	if n, err := result.RowsAffected(); err != nil && n != 1 {
		return err
	}
	return nil
}

func (s *Shortcut) SaveLog(addr, userAgent string, reqTime time.Duration) {
	le := logEntry{
		ShortcutID:   s.ID,
		IPAddress:    addr,
		UserAgent:    userAgent,
		Region:       "", // TODO get region from ip address
		ResponseTime: reqTime.Nanoseconds() / 1e3,
	}
	loggerCh <- le
}
