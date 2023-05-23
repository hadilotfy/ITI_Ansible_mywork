from centos:latest

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum install -y openssh-server

# RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -E 's/^#(PermitRootLogin )no/\1yes/' /etc/ssh/sshd_config -i
RUN ssh-keygen -A

RUN yum install passwd -y && echo '123' | passwd root --stdin

ENTRYPOINT /usr/sbin/sshd && bash
