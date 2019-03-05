package routes

import (
	"encoding/json"
	"log"
	"net/http"
)

// Response is the main Response message, if HTTP Methods POST, PUT or DELETE are used
type Response struct {
	Success bool   `json:"success"`
	Code    int    `json:"code,omitempty"`
	Message string `json:"message,omitempty"`
}

var responseMalformedBody = Response{
	Success: false,
	Code:    1003,
	Message: "Malformed JSON body",
}

var responseMalformedJWT = Response{
	Success: false,
	Code:    1009,
	Message: "Malformed Authorization header",
}

var responseCredentialMismath = Response{
	Success: false,
	Code:    1008,
	Message: "Credentials do not match. Please try again",
}

var responseUnauthorized = Response{
	Success: false,
	Code:    1010,
	Message: "Unauthorized",
}

// JSON marshals the Response struct to a JSON string and sets the HTTP Statuscode
func (r Response) JSON(w http.ResponseWriter, statusCode int) {
	ArbitraryJSON(w, r, statusCode)
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
