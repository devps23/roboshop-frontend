FROM             docker.io/nginx
RUN              rm -rf /usr/share/nginx/html/*
RUN              index.html /usr/share/nginx/html/




