Kafka-based solution for IBAN validity scanner
====

## Instructions:

Steps how to start current service:

1. Launch Kafka broker.
2. Run mvn -T 1C clean install
3. cd prime-app/target
4. Run java -jar prime-app.jar
5. cd test-data-producer/target
6. Run java -jar test-data-producer.jar
7. Use any REST client to download test payload. Method POST

```
 http://localhost:8081/downloadTestData
```

Payload example:

```
[{
    "url":"file:///D:/Java%20Projects/TestDataWithoutSuspicious.pdf",
    "fileType":"PDF"
  },
  {
    "url":"file:///D:/Java%20Projects/TestDataWithSuspicious.pdf",
    "fileType":"PDF"
  },
  {
    "url":"file:///D:/Java%20Projects/NotExistingPdf.pdf",
    "fileType":"PDF"
}]
```
8. Check out the latest messages for verification results from Kafka. 
```
 kafka-console-consumer.bat(or .sh) --bootstrap-server localhost:9092 --topic checkResultEventTopic --from-beginning
```

Note: As blacklisted IBANs the application considers (list stored in DB):
```
DE15300606010505780780 
UPC82771401621500311 
124343433444444444444 
```