FROM ubuntu:latest

RUN apt update -y && \ 
    apt install nginx -y 

RUN systemctl start nginx && systemctl enable nginx
WORKDIR /app

CMD ["nginx","-g" ,"daemon off;"]


