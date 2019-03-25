package routes

import (
	"encoding/json"
	"github.com/davidkroell/shortcut/models"
	"net/http"
)

func registerUser(w http.ResponseWriter, r *http.Request) {
	var req registerRequest

	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		responseMalformedBody.JSON(w)
		return
	}

	u := models.User{
		Email:     req.Email,
		Firstname: req.Firstname,
		Lastname:  req.Lastname,
	}

	// check password
	if len(req.Password) < 8 {
		NewResponse(false, "password to short", 1012).
			JSON(w, http.StatusBadRequest)
		return
	}

	u.SetPassword(req.Password)
	if err := u.Save(); err != nil {
		responseMalformedBody.JSON(w)
		return
	}

	jwt, err := u.JWT()
	if err != nil {
		responseMalformedBody.JSON(w)
		return
	}

	NewResponse(true, "registerd").
		Attr("firstName", u.Firstname).
		Attr("lastName", u.Lastname).
		Attr("email", u.Email).
		Attr("jwt", jwt).
		JSON(w, http.StatusOK)
}

func loginUser(w http.ResponseWriter, r *http.Request) {
	req := authRequest{}

	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		responseMalformedBody.JSON(w)
	}

	u, err := models.UserAuth(req.Email, req.Password)
	if err == nil {
		// auth successful
		token, _ := u.JWT()

		NewResponse(true, "authenticated").
			Attr("firstName", u.Firstname).
			Attr("lastName", u.Lastname).
			Attr("email", u.Email).
			Attr("jwt", token).
			JSON(w, http.StatusOK)
		return
	} else if err == models.ErrCredentialMismatch {
		responseCredentialMismath.JSON(w)
	}
}

func getUser(w http.ResponseWriter, r *http.Request) {

}

func updateUser(w http.ResponseWriter, r *http.Request) {

}
