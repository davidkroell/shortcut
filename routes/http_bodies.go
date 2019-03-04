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

// JSON marshals the Response struct to a JSON string and sets the HTTP Statuscode
func (r Response) JSON(w http.ResponseWriter, statusCode int) {
	w.WriteHeader(statusCode)

	err := json.NewEncoder(w).Encode(r)
	if err != nil {
		log.Println(err)
	}
}
