FROM golang:1.11.1-alpine AS build
ADD ./ /work/CircleCi-go-test/
WORKDIR /work/CircleCi-go-test/
RUN apk add make git
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ./bin/api ./cmd/api

FROM alpine
RUN mkdir /api
COPY --from=build /work/CircleCi-go-test/bin/api /api/
RUN chmod a+x /api/api
RUN apk add --no-cache ca-certificates
ARG BUILD_DATE
ENV DATETIME ${BUILD_DATE}
RUN echo ${DATETIME}
CMD \
    echo "Build date" && \
    echo ${DATETIME} && \
    /api/api -c /api/conf/api.toml