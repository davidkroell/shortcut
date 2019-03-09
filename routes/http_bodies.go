package routes

import (
	"encoding/json"
	"log"
	"net/http"
)

// Response is the main Response message, if HTTP Methods POST, PUT or DELETE are used
type Response map[string]interface{}

var responseMalformedBody = NewResponse(false, "Malformed JSON body", 1003, http.StatusBadRequest)
var responseMalformedJWT = NewResponse(false, "Malformed or missing authorization header", 1009, http.StatusBadRequest)
var responseCredentialMismath = NewResponse(false, "Credentials do not match", 1008, http.StatusUnauthorized)
var responseUnauthorized = NewResponse(false, "Unauthorized", 1010, http.StatusUnauthorized)
var responseNotFound = NewResponse(false, "Not found", 1002, http.StatusNotFound)
var responseUnknownError = NewResponse(false, "Unhandled error", 1012, http.StatusInternalServerError)

func NewResponse(success bool, message string, codes ...int) Response {
	r := Response{}
	r["success"] = success
	r["message"] = message

	if len(codes) >= 1 {
		r["code"] = codes[0]
	}
	if len(codes) == 2 {
		r["statusCode"] = codes[1]
	}

	return r
}

// JSON marshals the Response struct to a JSON string and sets the HTTP Statuscode
func (r Response) JSON(w http.ResponseWriter, statusCode ...int) {
	if len(statusCode) == 1 {
		ArbitraryJSON(w, r, statusCode[0])
	} else {
		_, ok := r["statusCode"]
		if ok {
			code := r["statusCode"].(int)
			// remove statuscode from response map to not render it
			delete(r, "statusCode")
			ArbitraryJSON(w, r, code)
		} else {
			log.Println("Error in parsing response map")
			ArbitraryJSON(w, r, http.StatusOK)
		}
	}
}

func (r Response) Attr(key string, value interface{}) Response {
	r[key] = value
	return r
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
