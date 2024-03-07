FROM debian:bullseye-slim

USER root

RUN apt-get update && \
    apt-get install -y bash net-tools git libssl-dev build-essential libpcre3 libpcre3-dev zlib1g-dev wget curl git ffmpeg apache2-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN git clone https://github.com/nginx/nginx.git && \
    git clone https://github.com/arut/nginx-rtmp-module.git && \
    cd nginx && \
    ./auto/configure --add-module=../nginx-rtmp-module && \
    make && \
    make install

RUN mv /opt/nginx/conf/nginx.conf /opt/nginx/conf/nginx.conf_bak
RUN mv /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf_bak

COPY ./nginx.conf /opt/nginx/conf/nginx.conf
COPY ./nginx.conf /usr/local/nginx/conf/nginx.conf

# Copy and make auth.py executable
COPY ./auth.py /opt/auth.py
RUN chmod +x /opt/auth.py

# Create recordings directory and set ownership as root
RUN mkdir /usr/local/nginx/recordings
RUN mkdir -p /etc/nginx
RUN chown -R root:root /usr/local/nginx/recordings
RUN chown -R root:root /etc/nginx
RUN touch /etc/nginx/.htpasswd
RUN chmod 644 /etc/nginx/.htpasswd

EXPOSE 1935
EXPOSE 80

ENV PATH="/usr/local/nginx/sbin:${PATH}"

CMD ["nginx", "-g", "daemon off;"]
