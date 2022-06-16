FROM golang:1.18-alpine3.15 AS build

ENV CGO_ENABLED 0

RUN apk add --no-cache git
WORKDIR /
COPY . .


RUN go build -o ./app .

# Get Delve from a GOPATH not from a Go Modules project
WORKDIR /go/src/

#RUN go get github.com/go-delve/delve/cmd/dlv

# for global installation
RUN go install github.com/go-delve/delve/cmd/dlv@latest

FROM alpine:3.11

WORKDIR /
COPY --from=build /app /
COPY --from=build /go/bin/dlv /

EXPOSE 8090 2345

ENTRYPOINT [ "/dlv" ]