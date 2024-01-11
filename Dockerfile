FROM ubuntu/nginx:latest
WORKDIR /home/
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./mini_web_server.c /home/mini_web_server.c
COPY ./run_docker.sh /home/run_docker.sh
RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    chmod +x ./run_docker.sh; \
    gcc mini_web_server.c -lfcgi; \
    rm -rf /var/lib/apt/lists


ENTRYPOINT  ["./run_docker.sh"]