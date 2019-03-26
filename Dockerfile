# base image for building the binary
FROM golang:1.12-alpine AS base
COPY . /go/src/github.com/davidkroell/shortcut

WORKDIR /go/src/github.com/davidkroell/shortcut
RUN apk add git gcc

ENV GO111MODULE=on
RUN go mod download

# run tests before build
RUN go test ./... -race

# binary output path: /go/bin/shortcut
RUN go build -a -tags netgo -ldflags '-w' -o /go/bin/shortcut *.go


FROM scratch
COPY --from=base /go/bin/shortcut /shortcut
ENTRYPOINT ["/shortcut"]
