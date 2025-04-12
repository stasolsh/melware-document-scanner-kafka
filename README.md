Kafka-based solution for IBAN validity scanner
====

## Instructions:

Steps how to start current service:

#### 1. Run malware-document-scanner-kafka locally:
Go to \docker-local and run
```
run.bat|sh
```

#### 2. Use any REST client to download test payload. Method POST
```
 http://localhost:9091/downloadTestData
```

Payload example:

```
[{
    "url":"file:///var/www/html/TestDataWithoutSuspicious.pdf",
    "fileType":"PDF"
  },
  {
    "url":"file:///var/www/html/TestDataWithSuspicious.pdf",
    "fileType":"PDF"
  },
  {
    "url":"file:///var/www/html/NotExistingPdf.pdf",
    "fileType":"PDF"
}]
```
#### 3. Check out the latest messages for verification results from Kafka.

```
 kafka-console-consumer --bootstrap-server localhost:9092 --topic checkResultEventTopic --from-beginning
```

Note: As blacklisted IBANs the application considers (list stored in DB):
```
DE15300606010505780780 
UPC82771401621500311 
124343433444444444444 
```

#### 4. Stop services with:
```
stop.bat|sh
```