# Use minimal Go image
FROM golang:1.24.4-alpine AS build

WORKDIR /app
COPY . .
RUN go build -o server .

# Run with distroless base image
FROM gcr.io/distroless/static
COPY --from=build /app/server /
EXPOSE 8080
ENTRYPOINT ["/server"]
