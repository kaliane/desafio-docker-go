FROM golang as builder

WORKDIR /src

RUN go mod init example/fullcycle

COPY index.go /src

RUN go build -o appgo

FROM scratch
WORKDIR /app
COPY --from=builder /src .
CMD [ "./appgo" ]