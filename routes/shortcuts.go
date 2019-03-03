package routes

import (
	"github.com/davidkroell/shortcut/models"
	"github.com/gorilla/mux"
	"net/http"
)

func createShortcut(w http.ResponseWriter, r *http.Request) {

}

func listShortcuts(w http.ResponseWriter, r *http.Request) {

}

func getShortcut(w http.ResponseWriter, r *http.Request) {

}

func updateShortcut(w http.ResponseWriter, r *http.Request) {

}

func deleteShortcut(w http.ResponseWriter, r *http.Request) {

}

func forwardShortcut(w http.ResponseWriter, r *http.Request) {
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

	http.Redirect(w, r, shortcut.RedirectURL, shortcut.RedirectStatus)
}
