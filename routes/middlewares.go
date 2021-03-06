package routes

import (
	"context"
	"github.com/davidkroell/shortcut/models"
	"log"
	"net/http"
	"strings"
	"time"
)

var jsonBody = "application/json"
var htmlBody = "text/html"

const logFormat string = "%s %s %s %s %s"

// MiddlewareFunc is a custom Middleware type
type MiddlewareFunc func(http.Handler) http.Handler

// RequestLogger logs each request
func RequestLogger(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		start := time.Now()

		next.ServeHTTP(w, r)

		end := time.Since(start)
		log.Printf(logFormat, r.Method, r.RequestURI, r.RemoteAddr, end, r.UserAgent())
	})
}

// HeaderBinding checks if HTTP Headers are set correctly and sets response Headers
func HeaderBinding(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {

		if r.Method == "POST" {
			if r.Header.Get("Content-Type") != jsonBody {
				NewResponse(false, "Wrong Content-Type in POST request. application/json expected", 1000).
					JSON(w, 400)
				return
			}
		}

		if r.Header.Get("Accept") == jsonBody {
			w.Header().Set("Content-Type", jsonBody)
		} else {
			w.Header().Set("Content-Type", htmlBody)
		}

		next.ServeHTTP(w, r)
	})
}

// Authentication
func Authentication(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		header := r.Header.Get("Authorization")
		headerParts := strings.Split(header, "Bearer ")
		if len(headerParts) < 2 {
			responseMalformedJWT.JSON(w)
			return
		}

		u, err := models.UserJWT(headerParts[1])
		if err != nil {
			log.Println(err)
			responseUnauthorized.JSON(w)
			return
		}

		ctx := context.WithValue(r.Context(), "User", u)
		next.ServeHTTP(w, r.WithContext(ctx))
	})
}
