package routes

import (
	"github.com/gorilla/mux"
)

func InitRouter() (router mux.Router) {
	router.Use(RequestLogger, HeaderBinding)
	router.HandleFunc("/users/auth/new", registerUser).Methods("POST")
	router.HandleFunc("/users/auth", loginUser).Methods("POST")

	api := router.PathPrefix("/api").Subrouter()
	api.Use(Authentication)

	api.HandleFunc("/shortcuts", createShortcut).Methods("POST")
	api.HandleFunc("/shortcuts", listShortcuts).Methods("GET")
	api.HandleFunc("/shortcuts/{id}", getShortcut).Methods("GET")
	api.HandleFunc("/shortcuts/{id}", updateShortcut).Methods("PUT")
	api.HandleFunc("/shortcuts/{id}", deleteShortcut).Methods("DELETE")

	api.HandleFunc("/user", getUser).Methods("GET")
	api.HandleFunc("/user", updateUser).Methods("PUT")

	router.HandleFunc("/{shortId:[a-zA-Z0-9]+}", forwardShortcut).Methods("GET")

	return
}
