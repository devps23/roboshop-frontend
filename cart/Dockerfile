FROM                       node:22.14.0-bullseye-slim As build-steps
RUN                        apt update && apt install unzip -y
WORKDIR                    /tmp
ADD                        https://roboshop-artifacts.s3.amazonaws.com/cart.zip    /tmp/cart.zip
RUN                        mkdir /app
WORKDIR                    /app
RUN                        unzip  /tmp/cart.zip
WORKDIR                    /tmp/user.zip -d  /app


FROM                       node:22.14-bullseye-slim
RUN                        apt update && apt install npm -y
RUN                        mkdir /app
WORKDIR                    /app
COPY                      --from=build-steps /app  /app
RUN                        npm install