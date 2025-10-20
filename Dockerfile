### BUILDER
FROM --platform=${BUILDPLATFORM:-linux/amd64} golang:1.16 AS builder

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG TARGETOS
ARG TARGETARCH

WORKDIR /app/

ADD ./src/* .
RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -ldflags="-w -s" -o /gobot .

### RUNTIME
FROM scratch

WORKDIR /app/
COPY --from=builder /gobot /gobot

EXPOSE 8080

ENTRYPOINT ["/gobot"]
CMD ["-port", "8080"]
