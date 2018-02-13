#!/bin/bash

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o echoer

cp echoer centos/echoer
cp echoer alpine/echoer
cp echoer alpine3.2/echoer
cp echoer alpine3.3/echoer
cp echoer alpine3.4/echoer
cp echoer alpine3.5/echoer
cp echoer alpine3.6/echoer

docker build -t mfenwickbd/centos-echoer centos/
docker build -t mfenwickbd/alpine-echoer alpine/
docker build -t mfenwickbd/alpine-echoer-3.2 alpine-3.2/
docker build -t mfenwickbd/alpine-echoer-3.3 alpine-3.3/
docker build -t mfenwickbd/alpine-echoer-3.4 alpine-3.4/
docker build -t mfenwickbd/alpine-echoer-3.5 alpine-3.5/
docker build -t mfenwickbd/alpine-echoer-3.6 alpine-3.6/

docker push mfenwickbd/centos-echoer:latest
docker push mfenwickbd/alpine-echoer:latest
docker push mfenwickbd/alpine-echoer-3.2:latest
docker push mfenwickbd/alpine-echoer-3.3:latest
docker push mfenwickbd/alpine-echoer-3.4:latest
docker push mfenwickbd/alpine-echoer-3.5:latest
docker push mfenwickbd/alpine-echoer-3.6:latest

# preconditions: have deleted any existing app and images

oc new-project mff
oc project mff
oc new-app mfenwickbd/centos-echoer:latest
oc new-app mfenwickbd/alpine-echoer:latest
oc new-app mfenwickbd/alpine-echoer-3.2:latest
oc new-app mfenwickbd/alpine-echoer-3.3:latest
oc new-app mfenwickbd/alpine-echoer-3.4:latest
oc new-app mfenwickbd/alpine-echoer-3.5:latest
oc new-app mfenwickbd/alpine-echoer-3.6:latest
