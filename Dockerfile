FROM broadinstitute/scala-baseimage:latest

# RUN groupadd -r pcuser && useradd -r -g pcuser pcuser

RUN apt-get update && apt-get install -y git

RUN mkdir -p /nlp
RUN cd /nlp && git clone -b master https://github.com/jvwong/reach.git

WORKDIR /nlp/reach
RUN sbt compile

# RUN chown -R pcuser:pcuser /nlp/reach/

EXPOSE 8080
COPY sbt.sh /
# USER pcuser

CMD ["/sbt.sh"]
