FROM docker.io/library/centos:7

LABEL 'com.github.actions.name'='Lint RPM specs'
LABEL 'com.github.actions.description'='Lint RPM spec files'

RUN yum -y install \
    epel-release-7 \
    rpmlint-1.5 \
    && yum -y clean all

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]

WORKDIR /app
