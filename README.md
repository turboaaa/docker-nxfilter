# docker-nxfilter
My take on nxfilter in Docker

# Instructions
Standard nxfilter docker container stuff.

```docker build -t nxfilter -f Dockerfile .```

```docker run -dit --name <insert name> -p 80:80 -p 443:443 -p 53:53/udp nxfilter```
