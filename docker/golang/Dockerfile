# Start from the official Go image for building the binary
FROM golang:1.23.3 as builder

# Set the Current Working Directory inside the container
WORKDIR /srv

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY src/go.mod src/go.sum /srv/src/
WORKDIR /srv/src
# Download all dependencies
RUN go mod download

WORKDIR /srv
# Copy the source from the current directory to the Working Directory inside the container
COPY . .

WORKDIR /srv/src
# Set the architecture to arm64 and build the Go app
RUN CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -a -o server .

# Start a new stage from a minimal base image
FROM alpine:latest

# Set the Current Working Directory inside the container
WORKDIR /root/

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /srv/src/server .

# Make sure the file has the correct permissions to execute
RUN chmod +x /root/server

# List files to debug issues
RUN ls -al /root/

# Expose the port the app runs on
EXPOSE 8080

# Command to run the executable
CMD ["./server"]