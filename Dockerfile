FROM docker.io/library/centos:8

LABEL 'com.github.actions.name'='Lint RPM specs'
LABEL 'com.github.actions.description'='Lint RPM spec files'

RUN yum -y install \
    epel-release-7 \
    rpmlint-1.5 \
    && yum -y clean all

ENTRYPOINT [ "/usr/bin/rpmlint" ]

WORKDIR /app
