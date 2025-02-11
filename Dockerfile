FROM          docker.io/nginx:1.24
RUN           apt-get update && apt-get install unzip -y
RUN           rm -rf /usr/share/nginx/html/
WORKDIR       /tmp
ADD           https://roboshop-artifacts.s3.amazonaws.com/frontend.zip /tmp/frontend.zip
RUN           mkdir /usr/share/nginx/html
WORKDIR       /usr/share/nginx/html
RUN           unzip /tmp/frontend.zip -d  /usr/share/nginx/html/




# docker run -it docker.io/nginx/bash
#
# docker rm -f $(docker ps -qa)
