FROM ubuntu:18.04

COPY ./circleci-go-test /opt/
EXPOSE 8080

ENTRYPOINT ["/opt/circleci-go-test"]