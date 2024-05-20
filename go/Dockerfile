FROM golang:latest

WORKDIR /go/src/app
COPY . /go/src/app
RUN go mod init
RUN go build -o main .

CMD ["./main"]
