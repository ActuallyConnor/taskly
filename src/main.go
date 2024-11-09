package main

import (
	"fmt"
	. "github.com/actuallyconnor/toggle/domain"
)

func main() {
	p1 := &Page{Title: "TestPage", Body: []byte("This is a sample Page.")}
	p1.Save()
	p2, _ := LoadPage("TestPage")
	fmt.Println(string(p2.Body))
}
