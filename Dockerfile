FROM node:9

# File Author / Maintainer
MAINTAINER Aaron Benton

RUN apt-get install make && \
  npm install fakeit

COPY ./scripts/run /

WORKDIR /

ENV PATH=/node_modules/.bin:$PATH

ENTRYPOINT ["/run"]

CMD []