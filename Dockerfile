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
# FROM          redhat/ubi9 As build-steps
# WORKDIR       /app
# COPY          frontend/* /app/
# #stage2
#
# FROM          docker.io/nginx:1.24
# RUN           apt-get update && apt-get install unzip -y
# RUN           rm -rf /usr/share/nginx/html/* /etc/nginx/default.d/default.conf
# WORKDIR       /usr/share/nginx/html
# COPY          --from=build-steps /app /usr/share/nginx/html/
# ADD           roboshop.conf /etc/nginx/default.d/default.conf
# WORKDIR       /


 FROM                     nginx:alpine3.21-slim As build-steps
 RUN                      rm -rf /usr/share/nginx/html/*
 RUN                      apk update && apk add unzip
 WORKDIR                  /tmp
 ADD                      https://roboshop-artifacts.s3.amazonaws.com/frontend.zip /tmp/frontend.zip
 WORKDIR                  /usr/share/nginx/html
 RUN                      unzip  /tmp/frontend.zip -d  /usr/share/nginx/html/
 WORKDIR                  /tmp
 RUN                      rm -rf /tmp/frontend.zip
 WORKDIR                  /

 FROM                     nginx:alpine-slim
 WORKDIR                  /usr/share/nginx/html
 COPY                     --from=build-steps /usr/share/nginx/html/  /usr/share/nginx/html/
 COPY                     roboshop.conf  /etc/nginx/default.d/roboshop.conf








