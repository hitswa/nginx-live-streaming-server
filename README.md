# Live Streaming Server

How many type of streaming protocols are out there?

- RTSP: A real-time streaming protocol
- RTMP: A real-time messaging protocol
- HLS: An HTTP live streaming protocol
- HDS: An HTTP dynamic streaming protocol
- MSS: A Microsoft smooth streaming protocol
- MPEG-DASH: A Dynamic Adaptive Streaming over HTTP MPEG-DASH protocol
- SRT: A Secure Reliable Transport streaming protocol
- WebRTC: A streaming protocol that works with IoT and Android apps

# How to run?

```bash
chmod +x ./build_and_run.sh
```

```bash
./build_and_run.sh
```

how to create user password for port 80 server

```bash
htpasswd -c -b /etc/nginx/.htpasswd <username> <password>
```

this will generate username password in `/etc/nginx/.htpasswd` file in following format

```txt
username:$apr1$SALT$HASHED_PASSWORD
```

admin:$apr1$hdY0/qA9$xy.kqlpBq2IkMY5SYD1tJ1

Recordings

all recordings are available in `/usr/local/nginx/recordings` directory

without auth

rtmp:<server-ip>/<channel>

on obs 

rtmp://127.0.0.1/live/abc

on vlc

rtmp://127.0.0.1:1935/live/abc

with auth

on obs

add auth

on vlc

rtmp://<username>:<password>@127.0.0.1:1935/live/abc

rtmp://admin:admin@127.0.0.1:1935/live/abc