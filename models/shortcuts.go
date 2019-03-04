package models

import (
	"database/sql"
	"fmt"
	"time"
)

type Shortcut struct {
	ID             string    `json:"id"`
	ShortIdentifer string    `json:"shortIdentifier"`
	RedirectURL    string    `json:"redirectURL"`
	RedirectStatus int       `json:"redirectStatus"`
	CreatedAt      time.Time `json:"createdAt"`
	UpdatedAt      time.Time `json:"updatedAt"`
	ValidThru      time.Time `json:"validThru"`
	User           *User     `json:"user"`
	userID         string
}

const (
	selectShortcut      = `SELECT * FROM Shortcuts WHERE %s = ?;`
	loadRelatedShortcut = `SELECT * FROM Users WHERE ID = ?;`
	insertShortcut      = `INSERT INTO Shortcuts (ID, ShortIdentifier, RedirectURL, RedirectStatus, CreatedAt, UpdatedAt, ValidThru, UserID) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, ?, ?);`
	updateshortcut      = `UPDATE Shortcuts
SET ShortIdentifier = ?,
    RedirectURL     = ?,
    RedirectStatus  = ?,
    ValidThru       = ?
WHERE ID = ?;`
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

func (s *Shortcut) SetID(id string) {
	s.ID = id
}

func (s *Shortcut) Save() error {
	if s.ID == "" {
		return s.create()
	}
	return s.update()
}

func (s *Shortcut) create() error {
	if err := setUUIDAsID(s); err != nil {
		return err
	}

	// TODO remove
	s.userID = "00366fb9-cd76-47e0-b3c6-cbd611650d9e"

	_, err := db.Exec(insertShortcut, s.ID, s.ShortIdentifer, s.RedirectURL, s.RedirectStatus, s.ValidThru, s.userID)
	return err
}

func (s *Shortcut) update() error {
	_, err := db.Exec(updateshortcut, s.ShortIdentifer, s.RedirectURL, s.RedirectStatus, s.ValidThru, s.ID)
	return err
}

func (s *Shortcut) Delete() (err error) {
	panic("implement me")
}
