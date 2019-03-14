FROM searchathing/dotnet:bionic

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /opensource && cd /opensource && \
	git clone https://github.com/nextcloud/desktop.git

RUN apt-get update

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

#====================================================================

COPY ./imgdata/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/bin/bash", "--login"]
