package routes

import (
	"encoding/json"
	"github.com/davidkroell/shortcut/models"
	"github.com/go-sql-driver/mysql"
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

	user := r.Context().Value("User").(*models.User)
	s.UserID = user.ID

	if err := s.Save(); err != nil {
		if err.(*mysql.MySQLError).Number == 1062 {
			Response{
				Success: false,
				Code:    1011,
				Message: "Shortcut with identifier " + s.ShortIdentifer + " already exists",
			}.JSON(w, http.StatusBadRequest)
			return
		}
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

	user := r.Context().Value("User").(*models.User)

	shortcuts, err := user.Shortcuts(page, 20)
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

	user := r.Context().Value("User").(*models.User)

	shortcut, err := user.ShortcutBy(models.ID, id)
	if err != nil && err != models.ErrNotFound {
		Response{
			Success: false,
			Code:    1001,
			Message: "Bad Request. " + err.Error(),
		}.JSON(w, http.StatusBadRequest)
		return
	} else if err == models.ErrNotFound {
		responseNotFound.JSON(w)
		return
	}
	_ = json.NewEncoder(w).Encode(shortcut)
}

func updateShortcut(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	id := vars["id"]
	user := r.Context().Value("User").(*models.User)

	fromDb, err := models.ShortcutBy(models.ID, id)
	if err != nil && err != models.ErrNotFound {
		Response{
			Success: false,
			Code:    1001,
			Message: "Bad Request. " + err.Error(),
		}.JSON(w, http.StatusBadRequest)
		return
	} else if err == models.ErrNotFound {
		responseNotFound.JSON(w)
		return
	}

	// check if given id belongs to user
	if fromDb.UserID != user.ID {
		responseNotFound.JSON(w)
	}

	fromReq := models.Shortcut{}
	if err := json.NewDecoder(r.Body).Decode(&fromReq); err != nil {
		responseMalformedBody.JSON(w)
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
	user := r.Context().Value("User").(*models.User)

	err := models.DeleteFrom(models.TableShortcuts, models.ID, id, user.ID)
	if err != nil {
		Response{
			Success: false,
			Code:    1006,
			Message: "Failed to delete " + id,
		}.JSON(w, http.StatusBadRequest)
		return
	} else if err == models.ErrNotFound {
		responseNotFound.JSON(w, 404)
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

		if w.Header().Get("Content-Type") == jsonBody {
			responseNotFound.JSON(w)
		} else {
			responseNotFound.HTML(w, shortcutNotFound)
		}
		return
	}

	//end := time.Since(start)
	//fmt.Println(end.Nanoseconds() / 1000)

	http.Redirect(w, r, shortcut.RedirectURL, shortcut.RedirectStatus)
}
