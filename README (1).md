
# Project Title

Basic Information to practice Apache Kafka in local:

Run kafka cluster image from docker hub	docker run --rm -d  \	
	--network kafka-net \
	-p 2181:2181 \
	-p 3030:3030 \
	-p 9092:9092 \
	-p 8081:8081 \
	-p 8082:8082 \
	-e ADV_HOST=kafka-cluster \
	--name kafka-cluster \
	lensesio/fast-data-dev

Run kafka cluster image UI from docker hub	docker run --rm -d  \	
	--network kafka-net \
	-p 7000:8080 \
	-e DYNAMIC_CONFIG_ENABLED=TRUE \
	--name kafka-ui  \
	provectuslabs/kafka-ui

Create a topic and test in Kafka UI: 	./kafka-topics.sh --create --topic demo_topic --bootstrap-server localhost:9092

Create a topic with partition and test in UI:	./kafka-topics --create --topic partitioned_topic --partitions 3 --replication-factor 1 --bootstrap-server localhost:9092

Command to Check for the Path where all the kafka binaries are present: Find / -name "kafka"	
In CLI , if we want to see who is the leader, details about the broker: sh kafka-topics --describe --topic partitioned_topic --partitions 3 --replication-factor 1 --bootstrap-server localhost:9092	
		Retaintation time is always in millisecond
To add or modify like to add retation period: sh kafka-configs --bootstrap-server localhost:9092 --entity-type topics --entity-name partitioned_topic  --alter  --add-config retention.ms=172800000	

To check how many brokers : sh kafka-broker-api-versions --bootstrap-server localhost:9092	



## Used By

This project is used by the following companies:

- Company 1
- Company 2


## Demo

Insert gif or link to demo

