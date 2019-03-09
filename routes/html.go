package routes

import (
	"html/template"
	"log"
	"net/http"
)

var shortcutNotFound = *template.Must(template.New("shortcutNotFound").Parse(`<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>404 not found</title>
</head>
<body>

<div id="container">
    <div>
        <span id="header">Oops!</span>
        <div id="big">404</div>
        <span id="footer"><span class="highlight">{{.url}}</span> {{.message}}</span>
    </div>
</div>

</body>
<style>
    body {
        padding: 0;
        margin: 0;
    }
    
    .highlight {
        color: #757575;
    }

    #container {
        height: 100vh;
    }

    #container > div {
        font-family: Helvetica, sans-serif;
        position: absolute;
        left: 50%;
        top: 45%;
        max-width: 28em;
        width: 100%;
        text-align: center;
        -webkit-transform: translate(-50%, -50%);
        -moz-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        text-transform: uppercase;
    }

    #container #header {
        font-size: 2.25rem;
        position: relative;
        bottom: -2rem;
    }

    #container #big {
        font-size: 12rem;
        font-weight: bold;
        letter-spacing: -0.5rem;
        text-shadow: 0.05em 0.021em 0 #a4a4a4;
    }

    #container #footer {
        font-size: 1.5rem;
        position: relative;
        top: -1.75rem;
    }

</style>
</html>`))

// HTML Renders a given template and sends it to the http.ResponseWriter.
// Sets the given HTTP Statuscode
func (r Response) HTML(w http.ResponseWriter, tmpl template.Template, statusCode ...int) {
	if r.statusCode == 0 && len(statusCode) == 1 {
		w.WriteHeader(statusCode[0])
	} else {
		w.WriteHeader(r.statusCode)
	}

	if err := tmpl.Execute(w, r); err != nil {
		log.Println(err)
	}
}
