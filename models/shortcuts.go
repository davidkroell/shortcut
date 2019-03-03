package models

import (
	"database/sql"
	"fmt"
	"time"
)

type Shortcut struct {
	ID             string
	ShortIdentifer string
	RedirectURL    string
	RedirectStatus int
	CreatedAt      time.Time
	UpdatedAt      time.Time
	ValidThru      time.Time
	User           *User
	userID         string
}

const (
	selectShortcut      string = `SELECT * FROM Shortcuts WHERE %s = ?;`
	loadRelatedShortcut string = `SELECT * FROM Users WHERE ID = ?;`
)

func ShortcutBy(matcher MatchingField, value string) (*Shortcut, error) {
	s := &Shortcut{}

	// make sure user cannot parse matcher by malformed input
	row := db.QueryRow(fmt.Sprintf(selectShortcut, matcher), value)
	err := row.Scan(&s.ID, &s.ShortIdentifer, &s.RedirectURL, &s.RedirectStatus, &s.CreatedAt, &s.UpdatedAt, &s.ValidThru, &s.userID)

	if err != nil && err != sql.ErrNoRows {
		return nil, err
	} else if err == sql.ErrNoRows {
		return nil, ErrNotFound
	}

	return s, nil
}

func (s *Shortcut) LoadRelated() (err error) {
	result := db.QueryRow(loadRelatedShortcut, s.userID)

	if err := result.Scan(s.User.ID, s.User.Email, s.User.Firstname, s.User.Lastname, s.User.Password, s.User.CreatedAt, s.User.UpdatedAt, s.User.LastLogin); err != nil {
		return err
	}

	return nil
}
