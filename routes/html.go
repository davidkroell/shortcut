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

// HTML Renders a given template and sends it to the http.ResponseWriter.
// Sets the given HTTP Statuscode
func (r Response) HTML(w http.ResponseWriter, tmpl template.Template, statusCode ...int) {
	if len(statusCode) == 1 {
		w.WriteHeader(statusCode[0])
	} else {
		_, ok := r["statusCode"]
		if ok {
			code := r["statusCode"].(int)
			w.WriteHeader(code)
		}
	}

	if err := tmpl.Execute(w, r); err != nil {
		log.Println(err)
	}
}
