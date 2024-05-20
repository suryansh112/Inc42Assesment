FROM golang:latest

WORKDIR /go/src/app
COPY ${WORKSPACE}/go /go/src/app
RUN go mod init
RUN go build -o main .

CMD ["/go/src/app/main"]
