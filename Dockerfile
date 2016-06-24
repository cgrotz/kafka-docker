FROM java:openjdk-8-jre

ENV DEBIAN_FRONTEND noninteractive
ENV KAFKA_HOME /opt/kafka
ENV JMX_PORT 7000

# Install Kafka
RUN apt-get update && apt-get install -y --force-yes wget dnsutils && rm -rf /var/lib/apt/lists/* && apt-get clean && wget -q http://apache.mirrors.spacedump.net/kafka/0.10.0.0/kafka_2.11-0.10.0.0.tgz -O /tmp/kafka_2.11-0.10.0.0.tgz && tar xfz /tmp/kafka_2.11-0.10.0.0.tgz -C /opt && rm /tmp/kafka_2.11-0.10.0.0.tgz && mv /opt/kafka_2.11-0.10.0.0 /opt/kafka

# 9092 is kafka
EXPOSE 9092 9093 7000

CMD ["/opt/kafka/bin/kafka-server-start.sh","/opt/kafka/config/server.properties"]
