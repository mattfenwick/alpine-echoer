#!/bin/bash

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o echoer

docker build -t mfenwickbd/alpine-echoer .

docker push mfenwickbd/alpine-echoer:latest

# preconditions: have deleted any existing app and images

# oc project mff

# oc new-app mfenwickbd/alpine-echoer
