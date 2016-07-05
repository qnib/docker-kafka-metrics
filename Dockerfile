FROM qnib/kafka:0.10.0.0

ENV KAFKA_GRAPHITE_METRICS_ENABLED=true \
   KAFKA_GRAPHITE_METRICS_HOST=graphite.service.consul \
   KAFKA_GRAPHITE_METRICS_PORT=2003 \
   KAFKA_GRAPHITE_METRICS_EXCLUDE_REGEX=(kafka.network.*|kafka.*.topic.*) \
   KAFKA_GRAPHITE_METRICS_COUNT_ENABLED=true \
   KAFKA_GRAPHITE_METRICS_VER=1.0.4
ADD etc/consul-templates/kafka.server.properties.ctmpl /etc/consul-templates/
RUN cd /opt/kafka/libs/ \
 && wget -q https://github.com/ChristianKniep/kafka-graphite/releases/download/${KAFKA_GRAPHITE_METRICS_VER}/kafka-graphite-${KAFKA_GRAPHITE_METRICS_VER}.jar
