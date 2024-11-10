FROM golang:1-alpine3.20@sha256:aff1a3076b85ca725ab3075f8fe96fa6d39b1aa77ec8a312420b07549ba35fe6 AS production

WORKDIR /srv

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY src/go.mod src/go.sum ./src/
WORKDIR /srv/src
RUN go mod download && go mod verify

WORKDIR /srv
COPY . .
WORKDIR /srv/src
