FROM             nginx
RUN              rm -rf /usr/share/nginx/html/*
COPY             run.sh /
ENTRYPOINT      ["bash","/run.sh"]

