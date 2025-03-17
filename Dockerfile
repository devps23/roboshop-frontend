FROM             nginx
RUN              rm -rf /usr/share/nginx/html/*
RUN              mkdir /usr/share/nginx/html
COPY             run.sh /
ENTRYPOINT      ["bash","/run.sh"]

