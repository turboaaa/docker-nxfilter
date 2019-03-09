# docker-nxfilter
My take on nxfilter in Docker

# Instructions
Standard nxfilter docker container stuff.
docker build -t nxfilter -f Dockerfile . <br>
docker run -dit --name <insert name> -p 53:53 -p 80:80 -p 443:443 nxfilter
