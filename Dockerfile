FROM                         docker.io/nginx
RUN                          rm -rf /usr/share/nginx/html/*  /etc/nginx/conf.d/default.conf
COPY                         ./   /usr/share/nginx/html/
COPY                           roboshop.conf /etc/nginx/conf.d/default.conf




