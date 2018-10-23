//go:generate statik -src=./ui

package main

import (
	"log"
	"net/http"

	"github.com/rakyll/statik/fs"
	_ "github.com/rongfengliang/webui/statik"
)

func main() {
	statikFS, err := fs.New()
	if err != nil {
		log.Fatal(err)
	}
	http.Handle("/", http.StripPrefix("/ui", http.FileServer(statikFS)))
	http.ListenAndServe(":10080", nil)
}
