package routes

import (
	"encoding/json"
	"log"
	"net/http"
)

type Response struct {
	Success bool   `json:"success"`
	Code    int    `json:"code,omitempty"`
	Message string `json:"message,omitempty"`
}

func (r Response) JSON(w http.ResponseWriter, statusCode int) {
	w.WriteHeader(statusCode)

	err := json.NewEncoder(w).Encode(r)
	if err != nil {
		log.Println(err)
	}
}
