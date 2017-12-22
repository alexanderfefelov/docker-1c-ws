FROM httpd:2.4

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
  && apt-get -qq install --yes --no-install-recommends locales

RUN localedef --inputfile ru_RU --force --charmap UTF-8 --alias-file /usr/share/locale/locale.alias ru_RU.UTF-8
ENV LANG ru_RU.utf8

ADD *.deb /tmp/

ENV PLATFORM_VERSION 83
ENV SERVER_VERSION 8.3.10-2639
RUN dpkg --install /tmp/1c-enterprise$PLATFORM_VERSION-common_${SERVER_VERSION}_amd64.deb 2> /dev/null \
  && dpkg --install /tmp/1c-enterprise$PLATFORM_VERSION-ws_${SERVER_VERSION}_amd64.deb 2> /dev/null \
  && rm /tmp/*.deb

COPY container/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY container/webinst /usr/local/sbin/webinst
COPY container/index.html /usr/local/apache2/htdocs/index.html
COPY container/GitHub-Mark-32px.png /usr/local/apache2/htdocs/GitHub-Mark-32px.png

RUN ln -s /usr/local/apache2/conf/httpd.conf /httpd.conf

RUN mkdir /data

VOLUME /data
VOLUME /usr/local/apache2/conf
