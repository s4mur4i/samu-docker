From ubuntu:14.04
Maintainer Krisztian Banhidy <s4mur4i@balabit.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe multiverse restricted" > /etc/apt/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty-security main universe multiverse restricted" >> /etc/apt/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty-backports main universe multiverse restricted" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y git perl libcatalyst-perl libextutils-autoinstall-perl libdatetime-perl libdatetime-format-sqlite-perl libcatalyst-modules-extra-perl libcrypt-cbc-perl libexception-class-perl libemail-valid-perl libmodule-install-perl vim libcatalyst-devel-perl libdbix-class-timestamp-perl build-essential make cpanminus libcrypt-blowfish-perl libcatalyst-action-rest-perl libcrypt-blowfish-perl curl

RUN cpanm -i Digest::SHA1 Catalyst::Plugin::Session::State::URI Catalyst::Plugin::DateTime 

RUN env GIT_SSL_NO_VERIFY=true git clone https://dev.szamuraj.com/s4mur4i/samu.git

EXPOSE 3000

CMD /samu/start.sh
