FROM broadinstitute/scala-baseimage:latest

# RUN groupadd -r pcuser && useradd -r -g pcuser pcuser

RUN apt-get update && apt-get install -y git

RUN cd /tmp && git clone -b master https://github.com/clulab/reach.git
RUN mkdir -p /nlp/reach

WORKDIR /nlp/reach
RUN cp -r /tmp/reach/. /nlp/reach/
RUN sbt compile

# RUN chown -R pcuser:pcuser /nlp/reach/

EXPOSE 8888
COPY sbt.sh /
# USER pcuser

ENTRYPOINT ["/sbt.sh"]
