package routes

import (
	"encoding/json"
	"github.com/davidkroell/shortcut/models"
	"github.com/gorilla/mux"
	"net/http"
)

func createShortcut(w http.ResponseWriter, r *http.Request) {
	s := models.Shortcut{}

	if err := json.NewDecoder(r.Body).Decode(&s); err != nil {
		Response{
			Success: false,
			Code:    1003,
			Message: "Malformed JSON body",
		}.JSON(w, 400)
		return
	}

	if err := s.Save(); err != nil {
		Response{
			Success: false,
			Code:    1004,
			Message: "Internal server error. " + err.Error(),
		}.JSON(w, 500)
		return
	}

	Response{
		Success: true,
		Message: "created",
	}.JSON(w, 201)
}

func listShortcuts(w http.ResponseWriter, r *http.Request) {

}

func getShortcut(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id := vars["id"]

	shortcut, err := models.ShortcutBy(models.ID, id)
	if err != nil && err != models.ErrNotFound {
		Response{
			Success: false,
			Code:    1005,
			Message: "Bad Request. " + err.Error(),
		}.JSON(w, 400)
		return
	} else if err == models.ErrNotFound {
		Response{
			Success: false,
			Code:    1002,
			Message: id + " not found",
		}.JSON(w, 404)
		return
	}
	_ = json.NewEncoder(w).Encode(shortcut)
}

func updateShortcut(w http.ResponseWriter, r *http.Request) {

}

func deleteShortcut(w http.ResponseWriter, r *http.Request) {

}

func forwardShortcut(w http.ResponseWriter, r *http.Request) {
	//start := time.Now()
	vars := mux.Vars(r)
	shortId := vars["shortId"]

	shortcut, err := models.ShortcutBy(models.ShortIdentifier, shortId)
	if err != nil && err != models.ErrNotFound {
		Response{
			Success: false,
			Code:    1001,
			Message: "Bad Request. " + err.Error(),
		}.JSON(w, 400)
		return
	} else if err == models.ErrNotFound {
		resp := Response{
			Success: false,
			Code:    1002,
			Message: shortId + " not found",
		}

		if w.Header().Get("Content-Type") == jsonBody {
			resp.JSON(w, 404)
		} else {
			resp.HTML(w, 404, shortcutNotFound)
		}
		return
	}

	//end := time.Since(start)
	//fmt.Println(end.Nanoseconds() / 1000)

	http.Redirect(w, r, shortcut.RedirectURL, shortcut.RedirectStatus)
}
