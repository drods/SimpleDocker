FROM nginx
WORKDIR /home/
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./mini_web_server.c .
COPY ./run_docker.sh .
RUN apt-get update
RUN apt-get install -y gcc spawn-fcgi libfcgi-dev
ENTRYPOINT ["bash", "./run_docker.sh"]