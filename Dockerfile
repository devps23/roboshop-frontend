FROM                         docker.io/nginx
RUN                          rm -rf /usr/share/nginx/html/* /etc/nginx/default.d/roboshop.conf
RUN                          apt update && apt install -y unzip curl

WORKDIR                      /tmp
RUN                          curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
RUN                          unzip /tmp/frontend.zip
WORKDIR                      /usr/share/nginx/html
RUN                          mv /tmp/*    /usr/share/nginx/html/

