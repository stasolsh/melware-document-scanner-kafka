set ORIGIN=%cd%
cd ../../

docker compose -f docker-compose.yml down
cd %ORIGIN%