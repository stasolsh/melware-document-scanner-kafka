Kafka-based solution for IBAN validity scanner
====

![Build](https://github.com/stasolsh/melware-document-scanner-kafka/actions/workflows/custom-action.yml/badge.svg)
![Coverage](https://codecov.io/gh/stasolsh/melware-document-scanner-kafka/branch/master/graph/badge.svg)
![Java](https://img.shields.io/badge/Java-17-blue)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.x-6DB33F?logo=springboot)
![Maven](https://img.shields.io/badge/Maven-3.9+-blue)
![JUnit](https://img.shields.io/badge/JUnit-5-red?logo=junit5)
![License](https://img.shields.io/badge/license-MIT-green)

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