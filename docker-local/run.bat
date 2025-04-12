xcopy /s /y .\docker-compose.yml ..\..\

set ORIGIN=%cd%
cd ../../
set ROOT=%cd%

docker compose -f docker-compose.yml stop

echo %ROOT%
cd %ROOT%/malware-document-scanner-kafka/test-data-producer
call mvn -T 1C clean install -DskipTests=true

cd %ROOT%/malware-document-scanner-kafka/prime-app
call mvn -T 1C clean install -DskipTests=true

cd %ROOT%/
docker-compose -f docker-compose.yml up --build -d --no-deps

cd %ORIGIN%