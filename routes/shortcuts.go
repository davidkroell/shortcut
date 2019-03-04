package routes

import (
	"encoding/json"
	"github.com/davidkroell/shortcut/models"
	"github.com/gorilla/mux"
	"net/http"
	"strconv"
)

func createShortcut(w http.ResponseWriter, r *http.Request) {
	s := models.Shortcut{}

	if err := json.NewDecoder(r.Body).Decode(&s); err != nil {
		Response{
			Success: false,
			Code:    1003,
			Message: "Malformed JSON body",
		}.JSON(w, http.StatusBadRequest)
		return
	}

	if err := s.Save(); err != nil {
		Response{
			Success: false,
			Code:    1004,
			Message: "Internal server error. " + err.Error(),
		}.JSON(w, http.StatusInternalServerError)
		return
	}

	Response{
		Success: true,
		Message: "created",
	}.JSON(w, http.StatusCreated)
}

func listShortcuts(w http.ResponseWriter, r *http.Request) {
	pageStr := "0"
	urlArray, ok := r.URL.Query()["page"]
	if ok {
		pageStr = urlArray[0]
	}

	page, err := strconv.Atoi(pageStr)
	if err != nil {
		Response{
			Success: false,
			Code:    1007,
			Message: "Malformed URL. page must be int value",
		}.JSON(w, http.StatusBadRequest)
		return
	}

	shortcuts, err := models.Shortcuts(page, 20)
	if err != nil {
		Response{
			Success: false,
			Code:    1004,
			Message: "Internal server error. " + err.Error(),
		}.JSON(w, http.StatusInternalServerError)
		return
	}

	_ = json.NewEncoder(w).Encode(shortcuts)
}

func getShortcut(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id := vars["id"]

	shortcut, err := models.ShortcutBy(models.ID, id)
	if err != nil && err != models.ErrNotFound {
		Response{
			Success: false,
			Code:    1001,
			Message: "Bad Request. " + err.Error(),
		}.JSON(w, http.StatusBadRequest)
		return
	} else if err == models.ErrNotFound {
		Response{
			Success: false,
			Code:    1002,
			Message: id + " not found",
		}.JSON(w, http.StatusNotFound)
		return
	}
	_ = json.NewEncoder(w).Encode(shortcut)
}

func updateShortcut(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id := vars["id"]

	fromDb, err := models.ShortcutBy(models.ID, id)
	if err != nil && err != models.ErrNotFound {
		Response{
			Success: false,
			Code:    1001,
			Message: "Bad Request. " + err.Error(),
		}.JSON(w, http.StatusBadRequest)
		return
	} else if err == models.ErrNotFound {
		Response{
			Success: false,
			Code:    1002,
			Message: id + " not found",
		}.JSON(w, http.StatusNotFound)
		return
	}

	fromReq := models.Shortcut{}
	if err := json.NewDecoder(r.Body).Decode(&fromReq); err != nil {
		responseMalformedBody.JSON(w, http.StatusBadRequest)
		return
	}
	fromDb.ValidThru = fromReq.ValidThru
	fromDb.RedirectURL = fromReq.RedirectURL
	fromDb.RedirectStatus = fromReq.RedirectStatus
	fromDb.ShortIdentifer = fromReq.ShortIdentifer

	if err := fromDb.Save(); err != nil {
		Response{
			Success: false,
			Code:    1005,
			Message: "could not update. " + err.Error(),
		}.JSON(w, http.StatusBadRequest)
		return
	}

	Response{
		Success: true,
		Message: "updated",
	}.JSON(w, http.StatusOK)
}

func deleteShortcut(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)["id"]

	err := models.DeleteFrom(models.TableShortcuts, models.ID, id)
	if err != nil {
		Response{
			Success: false,
			Code:    1006,
			Message: "Failed to delete " + id,
		}.JSON(w, http.StatusBadRequest)
		return
	}

	Response{
		Success: true,
		Message: "deleted",
	}.JSON(w, http.StatusOK)
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
		}.JSON(w, http.StatusBadRequest)
		return
	} else if err == models.ErrNotFound {
		resp := Response{
			Success: false,
			Code:    1002,
			Message: shortId + " not found",
		}

		if w.Header().Get("Content-Type") == jsonBody {
			resp.JSON(w, http.StatusNotFound)
		} else {
			resp.HTML(w, http.StatusNotFound, shortcutNotFound)
		}
		return
	}

	//end := time.Since(start)
	//fmt.Println(end.Nanoseconds() / 1000)

	http.Redirect(w, r, shortcut.RedirectURL, shortcut.RedirectStatus)
}
