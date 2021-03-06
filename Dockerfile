FROM centos:7
MAINTAINER Michael Mast
#Keep base up to date
RUN yum -y upgrade
#Import the key and repo for the offical NXFilter supported repo
RUN rpm --import https://deepwoods.net/repo/deepwoods/RPM-GPG-KEY-deepwoods && rpm -Uhv https://deepwoods.net/repo/deepwoods/deepwoods-release-6-2.noarch.rpm && sed -i 's/http:\/\/www\./https:\/\//' /etc/yum.repos.d/deepwoods.repo
#Install nxfilter
RUN yum -y install nxfilter && mkdir /usr/src/nxfilter_base && mv /nxfilter/* /usr/src/nxfilter_base
#Setup java to run as non-root
RUN groupadd -g 54682 nxfilter && useradd -u 54682 -g nxfilter nxfilter && chown -R nxfilter:nxfilter /nxfilter
RUN find /usr/lib/jvm/ -name 'java*-openjdk-*' -exec /usr/sbin/setcap CAP_NET_BIND_SERVICE=+eip {}/jre/bin/java \;
RUN find /usr/ -name 'libjli.so' -exec /usr/bin/ln -s {} /usr/lib/ \; && ldconfig
COPY run.sh /run.sh
RUN chmod u+x /run.sh
#Run this sucker!
CMD /run.sh

