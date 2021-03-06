package routes

import (
	"github.com/gorilla/mux"
	"net/http"
)

func InitRouter() (router mux.Router) {
	router.Use(RequestLogger, HeaderBinding)
	// login and register routes
	router.HandleFunc("/auth/new", registerUser).Methods("POST")
	router.HandleFunc("/auth", loginUser).Methods("POST")

	// use authentication middleware on any API route
	api := router.PathPrefix("/api").Subrouter()
	api.Use(Authentication)

	// shortcut routes
	api.HandleFunc("/shortcuts", createShortcut).Methods("POST")
	api.HandleFunc("/shortcuts", listShortcuts).Methods("GET")
	api.HandleFunc("/shortcuts/{id}", getShortcut).Methods("GET")
	api.HandleFunc("/shortcuts/{id}", updateShortcut).Methods("PUT")
	api.HandleFunc("/shortcuts/{id}", deleteShortcut).Methods("DELETE")

	// user management routes
	api.HandleFunc("/user", getUser).Methods("GET")
	api.HandleFunc("/user", updateUser).Methods("PUT")

	// redirect route
	router.HandleFunc("/{shortId:[a-zA-Z0-9]+}", forwardShortcut).Methods("GET")

	router.NotFoundHandler = http.HandlerFunc(notFoundHandler)

	return
}

func notFoundHandler(w http.ResponseWriter, r *http.Request) {
	resp := NewResponse(false, "requested page not found")

	if r.Header.Get("Accept") == jsonBody {
		resp.JSON(w, http.StatusNotFound)
	} else {
		resp.HTML(w, shortcutNotFound, http.StatusNotFound)
	}
}
