FROM golang:1.19 as build

RUN mkdir -p /app
RUN apt-get update

WORKDIR /app

COPY ./ ./

RUN go build -v -ldflags="-X 'main.version=v1.2.0'" mammal.go

FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install curl -y

RUN mkdir -p /app/configs
RUN mkdir -p /app/var/logs

WORKDIR /app

COPY --from=build /app/mammal /app/mammal
COPY --from=build /app/config.dist.yml /app/configs/config.dist.yml

EXPOSE 8000

VOLUME /app/configs
VOLUME /app/var

RUN ./mammal version

CMD ["./mammal", "server", "-c", "/app/configs/config.dist.yml"]
