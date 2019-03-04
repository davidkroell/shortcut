package models

import (
	"errors"
	"fmt"
	"github.com/dgrijalva/jwt-go"
	"golang.org/x/crypto/bcrypt"
	"os"
	"time"
)

const (
	insertUser            string = `INSERT INTO Users (ID, Email, Firstname, Lastname, Password) VALUES (?, ?, ?, ?, ?);`
	selectUserBy          string = `SELECT * FROM Users WHERE %s = ?;`
	selectUserLimitOffset string = `SELECT * FROM Users LIMIT ?, ?;`
)

type User struct {
	ID        string    `json:"id"`
	Email     string    `json:"email"`
	Firstname string    `json:"firstname"`
	Lastname  string    `json:"lastname"`
	Password  []byte    `json:"-"`
	CreatedAt time.Time `json:"createdAt"`
	UpdatedAt time.Time `json:"updatedAt"`
	LastLogin time.Time `json:"lastLogin"`
}

func (u *User) SetID(id string) {
	u.ID = id
}

func (u *User) Save() error {
	if u.ID == "" {
		return u.create()
	}
	return u.update()
}

func (u *User) create() error {
	if err := setUUIDAsID(u); err != nil {
		return err
	}

	_, err := db.Exec(insertUser, u.ID, u.Email, u.Firstname, u.LastLogin, u.Password)
	return err
}

func (u *User) update() error {
	return nil
}

func AuthUser(email, password string) (*User, error) {
	u := User{}
	result := db.QueryRow(fmt.Sprintf(selectUserBy, Email), email)

	err := result.Scan(&u.ID, &u.Email, &u.Firstname, &u.Lastname, &u.Password, &u.CreatedAt, &u.UpdatedAt, &u.LastLogin)
	if err != nil {
		return nil, err
	}
	if u.CheckHash(password) {
		return &u, nil
	}
	return nil, ErrCredentialMismatch
}

func (u *User) CheckHash(plainText string) bool {
	err := bcrypt.CompareHashAndPassword(u.Password, []byte(plainText))
	return err == nil
}

func (u *User) JWT() (string, error) {
	if u == nil {
		return "", errors.New("user is nil")
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"ID":  u.ID,
		"exp": time.Now().Add(time.Duration(time.Hour * 24 * 14)).Unix(),
	})

	tokenString, err := token.SignedString([]byte(os.Getenv("JWT_SECRET")))
	if err != nil {
		return "", err
	}

	return tokenString, nil
}
