FROM golang:alpine

WORKDIR /app

# Download the Go modules
COPY src/go.mod src/go.sum ./
RUN go mod download

# Copy the gobot source code
COPY src/*.go ./

# Build gobot
RUN CGO_ENABLED=0 GOOS=linux go build -o /gobot

EXPOSE 8080

ENTRYPOINT ["/gobot"]
CMD ["-port", "8080"]
