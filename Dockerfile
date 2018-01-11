FROM centos:centos7
# FROM alpine:latest

# probably don't need the uid
RUN useradd --create-home --shell /bin/bash --uid 789 --gid root mynewuser
WORKDIR /home/mynewuser

RUN chmod -R 775 /home/mynewuser
RUN chown -R mynewuser:root /home/mynewuser

USER mynewuser

EXPOSE 3050

COPY echoer echoer
CMD ["./echoer"]
