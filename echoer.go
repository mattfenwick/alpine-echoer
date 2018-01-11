package main

import (
	"fmt"
	"net/http"
)

func main() {
	fmt.Print("about to start webserver")
	webserverMain()

	select {}
}

func echo(w http.ResponseWriter, r *http.Request) {
	err := r.ParseForm()
	if err != nil {
		http.Error(w, "couldn't parse form", 400)
		return
	}
	params := map[string]string{
		"message": r.Form.Get("message"),
	}
	fmt.Printf("responding to echo request: %v", params)
	fmt.Fprintf(w, "Received echo request: %v", params)
}

func webserverMain() {
	http.HandleFunc("/", echo)
	http.HandleFunc("/echo", echo)

	http.ListenAndServe(":3080", nil) // there's a random port number for ya
	fmt.Print("Http server started!\n")
}
