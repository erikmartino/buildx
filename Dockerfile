FROM --platform=$BUILDPLATFORM golang:alpine AS build
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "Build platform: $BUILDPLATFORM" >>/log
RUN echo "Target platform: $TARGETPLATFORM" >>/log
FROM alpine
COPY --from=build /log /log
ENTRYPOINT cat /log; echo -n "Run platform: "; uname -m
