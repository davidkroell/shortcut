package routes

import (
	"encoding/json"
	"log"
	"net/http"
)

// Response is the main Response message, if HTTP Methods POST, PUT or DELETE are used
type Response struct {
	Success    bool   `json:"success"`
	Code       int    `json:"code,omitempty"`
	Message    string `json:"message,omitempty"`
	statusCode int    `json:"-"`
}

var responseMalformedBody = Response{
	Success:    false,
	Code:       1003,
	Message:    "Malformed JSON body",
	statusCode: http.StatusBadRequest,
}

var responseMalformedJWT = Response{
	Success:    false,
	Code:       1009,
	Message:    "Malformed or missing authorization header",
	statusCode: http.StatusBadRequest,
}

var responseCredentialMismath = Response{
	Success:    false,
	Code:       1008,
	Message:    "Credentials do not match. Please try again",
	statusCode: http.StatusUnauthorized,
}

var responseUnauthorized = Response{
	Success:    false,
	Code:       1010,
	Message:    "Unauthorized",
	statusCode: http.StatusUnauthorized,
}

var responseNotFound = Response{
	Success:    false,
	Code:       1002,
	Message:    "not found",
	statusCode: http.StatusNotFound,
}

// JSON marshals the Response struct to a JSON string and sets the HTTP Statuscode
func (r Response) JSON(w http.ResponseWriter, statusCode ...int) {
	if r.statusCode == 0 && len(statusCode) == 1 {
		ArbitraryJSON(w, r, statusCode[0])
	} else {
		ArbitraryJSON(w, r, r.statusCode)
	}
}

// ArbitraryJSON takes an interface value and a statuscode and writes it to a given http.ResponseWriter
func ArbitraryJSON(w http.ResponseWriter, value interface{}, statusCode int) {
	w.WriteHeader(statusCode)

	err := json.NewEncoder(w).Encode(value)
	if err != nil {
		log.Println(err)
	}
}

type authRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}
