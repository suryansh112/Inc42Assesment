run:
	go run ./hello/main.go

unit-tests:
	go test ./hello/...

test-coverage:
	go test -coverprofile=cover.out -covermode=atomic
