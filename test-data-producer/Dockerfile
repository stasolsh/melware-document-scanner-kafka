FROM openjdk:17

ENV JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:9891"

ARG JAR_FILE=/target/test-data-producer.jar

ADD ${JAR_FILE} test-data-producer.jar

EXPOSE 9091 9893

CMD java -jar ${JAVA_OPTS} /test-data-producer.jar