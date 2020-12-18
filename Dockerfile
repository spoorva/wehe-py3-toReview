FROM ubuntu:focal
MAINTAINER Fangfan Li <li.fa@husky.neu.edu>
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --yes \
   apt-utils gcc libc-dev libmysqlclient-dev python3 python3-pip tcpdump \
   tcpreplay tshark wireshark
RUN pip3 install future gevent matplotlib multiprocessing_logging mysqlclient \
  netaddr prometheus_client psutil reverse-geocode reverse-geocoder \
  timezonefinder "tornado<6.0.0"
RUN apt install aptitude -y
RUN aptitude update
RUN aptitude safe-upgrade -y 
RUN aptitude install autoconf build-essential git libtool -y
WORKDIR  /git 
RUN git clone https://github.com/libparistraceroute/libparistraceroute.git
RUN pwd
RUN ls -al 
WORKDIR /git/libparistraceroute
RUN ls -al
WORKDIR /git/libparistraceroute/m4
WORKDIR /git/libparistraceroute
RUN ls -al
RUN ./autogen.sh 
RUN ./configure
RUN make
RUN make install
WORKDIR paris-traceroute 
RUN make all install

ADD src /wehe
ADD replayTraces /replayTraces
WORKDIR /wehe
# You must provide a local hostname argument when you start this image, as well
# as the net interface to listen on.
ENTRYPOINT ["/bin/bash", "./startserver.sh"]
