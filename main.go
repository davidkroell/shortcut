package main

import (
	"flag"
	"github.com/davidkroell/shortcut/models"
	"github.com/davidkroell/shortcut/routes"
	"github.com/joho/godotenv"
	"log"
	"net/http"
	"os"
)

var isMigrate = flag.Bool("migrate", false, "Migrate the database")
var isFresh = flag.Bool("fresh", false, "Recreate tables if they exist. Only in combination with -migrate")
var seedFile = flag.String("seed", "", "Seed the database with a given SQL file")
var serve = flag.Bool("serve", false, "Start the HTTP server and listen for requests")

func main() {
	flag.Parse()

	err := godotenv.Load()
	if err != nil {
		log.Println("No .env file present. Environment not loaded from file")
	}

	config := models.DBConfig{
		Driver:   os.Getenv("DB_CONNECTION"),
		Username: os.Getenv("DB_USERNAME"),
		Password: os.Getenv("DB_PASSWORD"),
		Host:     os.Getenv("DB_HOST"),
		Name:     os.Getenv("DB_DATABASE"),
	}

	db := models.InitDatabase(config)

	if *isMigrate {
		db.Migrate(*isFresh)
	}
	if *seedFile != "" {
		db.Seed(*seedFile)
	}

	if *serve {
		log.Println("HTTP Server listening on port " + os.Getenv("PORT"))
		router := routes.InitRouter()
		log.Fatal(http.ListenAndServe(":"+os.Getenv("PORT"), &router))
	} else if !*isMigrate && !*isFresh && *seedFile == "" {
		flag.Usage()
	}
}
