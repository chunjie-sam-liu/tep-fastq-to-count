FROM ubuntu:20.04
LABEL maintainer="Chun-Jie Liu <chunjie.sam.liu@gmail.com>"

ENV SHELL /usr/bin/bash

RUN apt-get update -qq \
  && apt-get -y --no-install-recommends install ping

# ENTRYPOINT ["/bin/echo", "Hello"]

# CMD [ "/bin/echo", "Hello world" ]

# CMD [ "ping", "localhost" ]
CMD [ "" ]