package routes

import (
	"html/template"
	"log"
	"net/http"
)

var shortcutNotFound = *template.Must(template.New("shortcutNotFound").Parse(`<html lang="en">
<body>
<h1>404</h1>
<h2>We could not find the requested page</h2>
<h3>Error code: {{.Code}}</h3>

<p>{{.Message}}</p>
</body>
</html>`))

func (r Response) HTML(w http.ResponseWriter, statusCode int, tmpl template.Template) {
	w.WriteHeader(statusCode)

	if err := tmpl.Execute(w, r); err != nil {
		log.Println(err)
	}
}