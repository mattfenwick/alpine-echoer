CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o echoer
docker build -t mfenwickbd/alpine-echoer .

# if running locally, can hit this from
#   http://localhost:3050/echo?me=hi
docker run -p 3050:3080 mfenwickbd/alpine-echoer
