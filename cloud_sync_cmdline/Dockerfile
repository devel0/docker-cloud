FROM searchathing/dotnet:bionic

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /opensource && cd /opensource && \
	git clone https://github.com/nextcloud/desktop.git

RUN echo "updating packages" && apt-get update

RUN apt-get -y install \
	cmake libssl-dev zlib1g-dev pkg-config libglib2.0-dev \
	libcloudproviders-dev qt5-default \
	texlive-latex-base \
	sphinx-common \
	libqt5webenginewidgets5 qtwebengine5-dev qt5keychain-dev qttools5-dev \
	libsqlite3-dev extra-cmake-modules \
	libkf5kio-dev doxygen appstream \
	software-properties-common build-essential mesa-common-dev libdbus-1-dev libqt5webkit5-dev

RUN cd /opensource/desktop && \
	mkdir build && cd build && \
	cmake .. && \
	make -j 4 && \
	make install && ldconfig

RUN apt-get -y install inotify-tools

RUN mkdir /scripts

COPY ./imgdata/sync-exclude.lst /
COPY ./imgdata/wait_changes.conf ./imgdata/wait_changes2.conf /etc/supervisor/conf.d/
COPY ./imgdata/sync.sh ./imgdata/wait_changes ./imgdata/wait_changes2 ./imgdata/update_etag /scripts/
COPY ./imgdata/req_etag.xml /root
COPY ./VARIABLES /root

#====================================================================

COPY ./imgdata/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash", "--login"]
