# FROM          docker.io/nginx:1.24
# RUN           apt-get update && apt-get install unzip -y
# RUN           rm -rf /usr/share/nginx/html/*
# WORKDIR       /tmp
# ADD           https://roboshop-artifacts.s3.amazonaws.com/frontend.zip /tmp/frontend.zip
# RUN           mkdir /usr/share/nginx/html
# WORKDIR       /usr/share/nginx/html
# ADD           unzip /tmp/frontend.zip -d  /usr/share/nginx/html/
# ADD           roboshop.conf /etc/nginx/default.d/roboshop.conf




# docker run -it docker.io/nginx/bash
#
# docker rm -f $(docker ps -qa)

# In Multi stage docker
#stage1
FROM          redhat/ubi9 As build-steps
WORKDIR       /app
COPY          frontend/* /app/
#stage2

FROM          docker.io/nginx:1.24
RUN           apt-get update && apt-get install unzip -y
RUN           rm -rf /usr/share/nginx/html/*
WORKDIR       /usr/share/nginx/html
COPY          --from=build-steps /app /usr/share/nginx/html/
ADD           roboshop.conf /etc/nginx/default.d/roboshop.conf



