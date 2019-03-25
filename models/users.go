package models

import (
	"database/sql"
	"errors"
	"fmt"
	"github.com/dgrijalva/jwt-go"
	"golang.org/x/crypto/bcrypt"
	"log"
	"os"
	"time"
)

const (
	insertUser            string = `INSERT INTO Users (Email, Firstname, Lastname, passwordHash) VALUES (?, ?, ?, ?);`
	updateUser            string = `UPDATE Users SET Firstname = ?, Lastname = ?, passwordHash = ? WHERE ID = ?;`
	setLastLogin          string = `UPDATE Users SET LastLogin = CURRENT_TIMESTAMP WHERE ID = ?`
	selectUserBy          string = `SELECT * FROM Users WHERE %s = ?;`
	selectUserLimitOffset string = `SELECT * FROM Users LIMIT ?, ?;`
)

type User struct {
	ID           int64     `json:"id"`
	Email        string    `json:"email"`
	Firstname    string    `json:"firstname"`
	Lastname     string    `json:"lastname"`
	passwordHash []byte    `json:"-"`
	CreatedAt    time.Time `json:"createdAt"`
	UpdatedAt    time.Time `json:"updatedAt"`
	LastLogin    time.Time `json:"lastLogin"`
}

func (u *User) SetID(id int64) {
	u.ID = id
}

func (u *User) SetPassword(pwStr string) {
	hash, err := bcrypt.GenerateFromPassword([]byte(pwStr), bcrypt.DefaultCost)
	if err != nil {
		log.Println(err)
	}
	u.passwordHash = hash
}

func UserBy(matcher ColumnMatcher, value int64) (*User, error) {
	u := &User{}

	// make sure user cannot parse matcher by malformed input
	row := db.QueryRow(fmt.Sprintf(selectUserBy, matcher), value)
	err := row.Scan(&u.ID, &u.Email, &u.Firstname, &u.Lastname, &u.passwordHash, &u.CreatedAt, &u.UpdatedAt, &u.LastLogin)

	if err != nil && err != sql.ErrNoRows {
		return nil, err
	} else if err == sql.ErrNoRows {
		return nil, ErrNotFound
	}

	return u, nil
}

func (u *User) Save() error {
	if u.ID == 0 {
		return u.create()
	}
	return u.update()
}

func (u *User) create() error {
	res, err := db.Exec(insertUser, u.Email, u.Firstname, u.Lastname, u.passwordHash)
	if err != nil {
		return err
	}
	id, err := res.LastInsertId()
	if err != nil {
		return err
	}
	u.ID = id
	return err
}

func (u *User) update() error {
	// todo implement

	_, err := db.Exec(updateUser, u.Firstname, u.Lastname, u.passwordHash, u.ID)
	return err
}

func UserAuth(email, password string) (*User, error) {
	u := User{}
	result := db.QueryRow(fmt.Sprintf(selectUserBy, Email), email)

	err := result.Scan(&u.ID, &u.Email, &u.Firstname, &u.Lastname, &u.passwordHash, &u.CreatedAt, &u.UpdatedAt, &u.LastLogin)
	if err != nil && err != sql.ErrNoRows {
		log.Println(err)
		return nil, ErrCredentialMismatch
	}
	if u.verifyHash(password) {
		_, err := db.Exec(setLastLogin, u.ID)
		if err != nil {
			fmt.Println(err)
			return nil, ErrCredentialMismatch
		}
		return &u, nil
	}
	return nil, ErrCredentialMismatch
}

func (u *User) verifyHash(plainText string) bool {
	err := bcrypt.CompareHashAndPassword(u.passwordHash, []byte(plainText))
	return err == nil
}

func UserJWT(tokenStr string) (*User, error) {
	token, err := jwt.Parse(tokenStr, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, ErrJWT
		}

		return []byte(os.Getenv("JWT_SECRET")), nil
	})

	if err == nil && token.Valid {
		claims := token.Claims.(jwt.MapClaims)
		id, ok := claims["ID"]
		if !ok {
			return nil, ErrJWT
		}
		return UserBy(ID, int64(id.(float64)))
	}
	return nil, ErrJWT
}

func (u *User) JWT() (string, error) {
	if u == nil {
		return "", errors.New("user is nil")
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"ID": u.ID,
		// token is 2 weeks valid
		"exp": time.Now().Add(time.Hour * 24 * 14).Unix(),
	})

	tokenString, err := token.SignedString([]byte(os.Getenv("JWT_SECRET")))
	if err != nil {
		return "", err
	}

	return tokenString, nil
}
