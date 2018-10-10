FROM centos:7.5.1804
USER root
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
    systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;
RUN echo "proxy=http://192.168.1.254:3142" >> /etc/yum.conf
RUN yum install -y epel-release
RUN yum install -y ypserv policycoreutils incron withlock nmap && systemctl enable ypserv ypxfrd incrond
COPY incrontab /var/spool/incron/root
RUN chmod 0600 /var/spool/incron/root
COPY entrypoint.sh /
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/entrypoint.sh"]
