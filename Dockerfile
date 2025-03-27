 FROM                     docker.io/nginx:alpine3.21-slim As build-steps
 RUN                      rm -rf /usr/share/nginx/html/* /etc/nginx/default.d/default.conf /etc/nginx/nginx.conf
 RUN                      apk update && apk add unzip
 WORKDIR                  /tmp
 ADD                      https://roboshop-artifacts.s3.amazonaws.com/frontend.zip /tmp/frontend.zip
 WORKDIR                  /usr/share/nginx/html
 RUN                      unzip  /tmp/frontend.zip -d  /usr/share/nginx/html/
 WORKDIR                  /tmp
 RUN                      rm -rf /tmp/frontend.zip
 WORKDIR                  /

 FROM                     docker.io/nginx:alpine-slim
 WORKDIR                  /usr/share/nginx/html
 COPY                     --from=build-steps /usr/share/nginx/html/  /usr/share/nginx/html/
 COPY                     roboshop.conf  /etc/nginx/default.d/default.conf
 ADD                      nginx.conf /etc/nginx/nginx.conf


# FROM          docker.io/nginx
# RUN           rm -rf /usr/share/nginx/html/* /etc/nginx/conf.d/default.conf /etc/nginx/nginx.conf
# COPY          ./ /usr/share/nginx/html/
# ADD           roboshop.conf /etc/nginx/conf.d/default.conf
# ADD           nginx.conf /etc/nginx/nginx.conf








