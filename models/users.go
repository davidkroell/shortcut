package models

import (
	"time"
)

const (
	getUUID               string = `SELECT UUID()`
	insertUser            string = `INSERT INTO Users (ID, Email, Firstname, Lastname, Password) VALUES (?, ?, ?, ?, ?);`
	selectUserById        string = `SELECT * FROM Users WHERE ID = ?;`
	selectUserLimitOffset string = `SELECT * FROM Users LIMIT ?, ?;`
)

type User struct {
	ID        string
	Email     string
	Firstname string
	Lastname  string
	Password  []byte
	CreatedAt time.Time
	UpdatedAt time.Time
	LastLogin time.Time
}

func (u *User) Save() error {
	if u.ID == "" {
		return u.create()
	}
	return u.update()
}

func (u *User) create() error {
	result, err := db.Query(getUUID)
	if err != nil {
		return err
	}
	if err := result.Scan(&u.ID); err != nil {
		return err
	}

	_, err = db.Exec(insertUser, u.ID, u.Email, u.Firstname, u.LastLogin, u.Password)
	return err
}

func (u *User) update() error {
	return nil
}

func (u *User) Delete() error {
	return nil
}
