FROM alpine/git:latest

RUN apk add --no-cache bash rsync git
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
