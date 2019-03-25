package models

import (
	"database/sql"
	"fmt"
	"time"
)

type Shortcut struct {
	ID             int64     `json:"id"`
	ShortIdentifer string    `json:"shortIdentifier"`
	RedirectURL    string    `json:"redirectURL"`
	RedirectStatus int       `json:"redirectStatus"`
	CreatedAt      time.Time `json:"createdAt"`
	UpdatedAt      time.Time `json:"updatedAt"`
	ValidThru      time.Time `json:"validThru"`
	UserID         int64
}

const (
	selectShortcutBy        = `SELECT * FROM Shortcuts WHERE %s = ?;`
	selectShortcutByPerUser = `SELECT * FROM Shortcuts WHERE UserID = ? AND %s = ?;`
	selectShortcuts         = `SELECT * FROM Shortcuts LIMIT ?, ?;`
	selectShortcutsPerUser  = `SELECT * FROM Shortcuts WHERE UserID = ? LIMIT ?, ?;`
	loadRelatedShortcut     = `SELECT * FROM Users WHERE ID = ?;`
	insertShortcut          = `INSERT INTO Shortcuts (ShortIdentifier, RedirectURL, RedirectStatus, CreatedAt, UpdatedAt, ValidThru, UserID) VALUES (?, ?, ?, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, ?, ?);`
	updateshortcut          = `UPDATE Shortcuts
SET ShortIdentifier = ?,
    RedirectURL     = ?,
    RedirectStatus  = ?,
    ValidThru       = ?
WHERE ID = ?;`
)

func ShortcutBy(matcher ColumnMatcher, value string) (*Shortcut, error) {
	s := &Shortcut{}

	if matcher == ShortIdentifier {
		val, ok := cacher.Get(value)
		if ok {
			return val.(*Shortcut), nil
		}
	}

	// make sure user cannot parse matcher by malformed input
	row := db.QueryRow(fmt.Sprintf(selectShortcutBy, matcher), value)
	err := row.Scan(&s.ID, &s.ShortIdentifer, &s.RedirectURL, &s.RedirectStatus, &s.CreatedAt, &s.UpdatedAt, &s.ValidThru, &s.UserID)

	if err != nil && err != sql.ErrNoRows {
		return nil, err
	} else if err == sql.ErrNoRows {
		return nil, ErrNotFound
	}

	ok := cacher.Set(s.ShortIdentifer, s, true)
	if !ok {
		return s, ErrCache
	}

	return s, nil
}

func (u *User) ShortcutBy(matcher ColumnMatcher, value string) (*Shortcut, error) {
	s := &Shortcut{}

	// make sure user cannot parse matcher by malformed input
	row := db.QueryRow(fmt.Sprintf(selectShortcutByPerUser, matcher), u.ID, value)
	err := row.Scan(&s.ID, &s.ShortIdentifer, &s.RedirectURL, &s.RedirectStatus, &s.CreatedAt, &s.UpdatedAt, &s.ValidThru, &s.UserID)

	if err != nil && err != sql.ErrNoRows {
		return nil, err
	} else if err == sql.ErrNoRows {
		return nil, ErrNotFound
	}

	return s, nil
}

func Shortcuts(page, perPage int) (slist []Shortcut, err error) {
	rows, err := db.Query(selectShortcuts, page*perPage, perPage)
	if err != nil {
		return nil, err
	}

	return shortcutsFromRows(rows)
}

func (u *User) Shortcuts(page, perPage int) (slist []Shortcut, err error) {
	rows, err := db.Query(selectShortcutsPerUser, u.ID, page*perPage, perPage)
	if err != nil {
		return nil, err
	}

	return shortcutsFromRows(rows)
}

func shortcutsFromRows(rows *sql.Rows) ([]Shortcut, error) {
	slist := []Shortcut{}
	for rows.Next() {
		s := Shortcut{}

		err := rows.Scan(&s.ID, &s.ShortIdentifer, &s.RedirectURL, &s.RedirectStatus, &s.CreatedAt, &s.UpdatedAt, &s.ValidThru, &s.UserID)
		if err != nil {
			return nil, err
		}

		slist = append(slist, s)
	}
	return slist, nil
}

func (s *Shortcut) SetID(id int64) {
	s.ID = id
}

func (s *Shortcut) Save() error {
	if s.ID == 0 {
		return s.create()
	}
	return s.update()
}

func (s *Shortcut) create() error {
	_, err := db.Exec(insertShortcut, s.ShortIdentifer, s.RedirectURL, s.RedirectStatus, s.ValidThru, s.UserID)
	return err
}

func (s *Shortcut) update() error {
	result, err := db.Exec(updateshortcut, s.ShortIdentifer, s.RedirectURL, s.RedirectStatus, s.ValidThru, s.ID)
	if err != nil {
		return err
	}

	rows, _ := result.RowsAffected()
	if rows == 0 {
		return ErrNotFound
	}
	return err
}
