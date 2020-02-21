FROM docker.io/mamohr/centos-java

ENV KAFKA_VERSION=0.11.0.0 \
        CONTAINER_KAFKA_HOME=/data/kafka



ADD ./kafka_2.11-$KAFKA_VERSION.tgz  $CONTAINER_KAFKA_HOME


COPY ./kafka-server-start.sh  $CONTAINER_KAFKA_HOME/kafka_2.11-$KAFKA_VERSION/bin




#赋执行权限
RUN chmod +x $CONTAINER_KAFKA_HOME/kafka_2.11-$KAFKA_VERSION/bin/kafka-server-start.sh 


EXPOSE 9092

WORKDIR $CONTAINER_KAFKA_HOME/kafka_2.11-$KAFKA_VERSION

ENTRYPOINT ["bin/kafka-server-start.sh","config/server.properties"]
