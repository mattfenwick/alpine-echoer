CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o echoer
docker build -t mfenwickbd/alpine-echoer .
docker run -ti mfenwickbd/alpine-echoer sh
