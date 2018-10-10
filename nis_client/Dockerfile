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
RUN yum install -y ypbind ypserv policycoreutils nmap && systemctl enable ypbind ypserv ypxfrd
RUN echo '+:::::::' >> /etc/passwd &&\
    echo '+:::' >> /etc/group &&\
    sed -i -e 's/^passwd:.*/passwd: files nis sss/' -e 's/^shadow:.*/shadow: files nis sss/' -e 's/^group:.*/group: files nis sss/' /etc/nsswitch.conf &&\
    echo 'domain test.local server nis_server' >> /etc/yp.conf
COPY entrypoint.sh /
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/entrypoint.sh"]
