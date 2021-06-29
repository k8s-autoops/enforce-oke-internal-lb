FROM golang:1.14 AS builder
ENV GOPROXY https://goproxy.io
ENV CGO_ENABLED 0
WORKDIR /go/src/app
ADD . .
RUN go build -mod vendor -o /enforce-oke-internal-lb

FROM alpine:3.12
COPY --from=builder /enforce-oke-internal-lb /enforce-oke-internal-lb
CMD ["/enforce-oke-internal-lb"]