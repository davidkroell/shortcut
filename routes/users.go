package routes

import (
	"encoding/json"
	"github.com/davidkroell/shortcut/models"
	"net/http"
)

func registerUser(w http.ResponseWriter, r *http.Request) {

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
		resp := map[string]interface{}{"success": true, "jwt": token}

		ArbitraryJSON(w, resp, http.StatusOK)
		return
	} else if err == models.ErrCredentialMismatch {
		responseCredentialMismath.JSON(w)
	}
}

func getUser(w http.ResponseWriter, r *http.Request) {

}

func updateUser(w http.ResponseWriter, r *http.Request) {

}
