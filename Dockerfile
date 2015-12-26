# to build this container:
# docker build -t crossbar .
FROM python:2.7

RUN apt-get update && apt-get -y install libbz2-dev libncurses5-dev
RUN pip install cffi --upgrade
RUN pip install crossbar[all]

RUN mkdir /router
ADD . /router/

# You need to forward port 8080 with "-p 8080" on the command-line:
# docker run -p 8080 crossbar
ENTRYPOINT ["crossbar", "start", "--cbdir", "/router/.crossbar"]
