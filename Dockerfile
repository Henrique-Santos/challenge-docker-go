FROM golang:1.22-alpine AS build
WORKDIR /usr/src/app
COPY . .
RUN go mod init main
RUN go build -o /usr/local/bin/app

FROM scratch
WORKDIR /
COPY --from=build /usr/local/bin/app /usr/local/bin/app
CMD ["/usr/local/bin/app"]