FROM                         docker.io/nginx
RUN                          rm -rf /usr/share/nginx/html/* /etc/nginx/default.d/roboshop.conf
COPY                         ./   /usr/share/nginx/html/
ADD                          roboshop.conf  /etc/nginx/default.d/roboshop.conf



