FROM centos:7

ENV LC_ALL=en_US.UTF-8
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN yum -y update && yum -y install chrony tzdata && yum update tzdata -y && yum clean all

COPY chrony.conf /etc/chrony.conf

CMD ["/usr/sbin/chronyd", "-d", "-x"]
