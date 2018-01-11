package main

import "testing"

func TestWhatever(t *testing.T) {
	a := "a"
	if a != "a" {
		t.Logf("expected a to = a")
		t.Fail()
	}
}

func TestResultsJsonSerialization(t *testing.T) {

}
