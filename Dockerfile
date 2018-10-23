# build stage
FROM golang:1.10-alpine AS build-env
RUN apk --no-cache add build-base git bzr mercurial gcc && \
    go get github.com/rakyll/statik
ENV D=/go/src/github.com/rongfengliang/webui
ADD . $D
RUN cd $D &&  go generate && go build -o webui . && cp webui /tmp/

FROM alpine:latest
WORKDIR /app
EXPOSE 10080
COPY --from=build-env /tmp/webui /app/webui
CMD ["./webui"]