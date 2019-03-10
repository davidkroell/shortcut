package routes

import (
	"encoding/json"
	"github.com/davidkroell/shortcut/models"
	"github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"strconv"
	"time"
)

func createShortcut(w http.ResponseWriter, r *http.Request) {
	s := models.Shortcut{}

	if err := json.NewDecoder(r.Body).Decode(&s); err != nil {
		responseMalformedBody.JSON(w)
		return
	}

	user := r.Context().Value("User").(*models.User)
	s.UserID = user.ID

	if err := s.Save(); err != nil {
		if err.(*mysql.MySQLError).Number == 1062 {
			NewResponse(false, "Shortcut with identifier "+s.ShortIdentifer+" already exists", 1011).
				JSON(w, http.StatusBadRequest)
			return
		}
		responseUnknownError.JSON(w)
		return
	}

	NewResponse(true, "created").
		Attr("id", s.ID).
		JSON(w, http.StatusCreated)
}

func listShortcuts(w http.ResponseWriter, r *http.Request) {
	pageStr := "0"
	urlArray, ok := r.URL.Query()["page"]
	if ok {
		pageStr = urlArray[0]
	}

	page, err := strconv.Atoi(pageStr)
	if err != nil {
		NewResponse(false, "Malformed URL. page must be a number", 1007).
			JSON(w, http.StatusBadRequest)
		return
	}

	user := r.Context().Value("User").(*models.User)

	shortcuts, err := user.Shortcuts(page, 20)
	if err != nil {
		responseUnknownError.JSON(w)
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
		log.Println(err)
		responseUnknownError.JSON(w)
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
		log.Println(err)
		responseUnknownError.JSON(w)
		return
	} else if err == models.ErrNotFound {
		responseNotFound.JSON(w)
		return
	}

	// check if given id belongs to user
	if fromDb.UserID != user.ID {
		responseNotFound.JSON(w)
		return
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
		log.Println(err)
		NewResponse(false, "Could not update", 1005).
			JSON(w, http.StatusBadRequest)
		return
	}

	NewResponse(true, "updated").
		JSON(w, http.StatusOK)
}

func deleteShortcut(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)["id"]
	user := r.Context().Value("User").(*models.User)

	err := models.DeleteFrom(models.TableShortcuts, models.ID, id, user.ID)
	if err == models.ErrNotFound {
		responseNotFound.JSON(w)
		return
	} else if err != nil {
		log.Println(err)
		responseUnknownError.JSON(w)
		return
	}

	NewResponse(true, "deleted").
		JSON(w, http.StatusOK)
}

func forwardShortcut(w http.ResponseWriter, r *http.Request) {
	start := time.Now()

	vars := mux.Vars(r)
	shortId := vars["shortId"]

	shortcut, err := models.ShortcutBy(models.ShortIdentifier, shortId)
	if err != nil && err != models.ErrNotFound {
		log.Println(err)
		responseUnknownError.JSON(w)
		return
	} else if err == models.ErrNotFound {

		if w.Header().Get("Content-Type") == jsonBody {
			responseNotFound.JSON(w)
		} else {
			responseNotFound.Attr("url", shortId).HTML(w, shortcutNotFound)
		}
		return
	}

	shortcut.SaveLog(r.RemoteAddr, r.UserAgent(), time.Since(start))

	http.Redirect(w, r, shortcut.RedirectURL, shortcut.RedirectStatus)
}
