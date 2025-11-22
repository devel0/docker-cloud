FROM ubuntu:resolute

ENV HOME=/root
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update

RUN \
        apt-get install -y \
        build-essential git cmake extra-cmake-modules pkg-config apt-file \
        openssl libssl-dev libp11-dev libp11-dev zlib1g-dev \
        qt6-base-dev libqt6keychain1 qtkeychain-qt6-dev libkf6archive-dev \
        qt6-websockets-dev qt6-svg-dev libqt6qml6 libkf6guiaddons-dev \
        libsqlite3-dev inkscape

RUN mkdir /opensource && cd /opensource && \
        git clone https://github.com/nextcloud/desktop.git

RUN \
        apt install -y \
        libaccounts-qt6-dev libadwaitaqt6-dev libappstreamqt-dev libcgal-qt6-dev \
        libdrumstick-dev libdtk6log-dev libfcitx5-qt6-dev libfm-qt6-dev \
        libgsettings-qt6-dev libkcolorpicker-qt6-dev libkdcrawqt6-dev \
        libkddockwidgets-qt6-dev libkdsingleapplication-qt6-dev libkdsoap-dev \
        libkexiv2qt6-dev libkimageannotator-qt6-dev libkode-qt6-dev liblastfm6-dev \
        libldm-common-qt6-dev liblomiri-action-qt6-1-dev liblomiri-content-hub-qt6-dev \
        liblomiri-download-manager-client-qt6-dev liblomiri-download-manager-common-qt6-dev \
        libmygpo-qt6-dev libpackagekitqt6-dev libphonon4qt6-dev libphonon4qt6experimental-dev \
        libplasma5support-dev libpolkit-qt6-1-dev libpoppler-qt6-dev libposixsignalmanager-qt6-dev \
        libqaccessibilityclient-qt6-dev libqca-qt6-dev libqgpgmeqt6-dev libqscintilla2-qt6-dev \
        libqt6pas-dev libqt6xdg-dev libqt6xdgiconloader-dev libqtdbustest-qt6-dev libqtspell-qt6-dev \
        libquazip1-qt6-dev libquotient-dev libqwebdav-qt6-dev libqxmppqt6-dev libsignon-qt6-dev \
        libsnapd-qt-dev libsoqt-common-dev libsoqt620-dev libsysstat-qt6-1-dev libtuiwidgets-qt6-dev \
        qcoro-qt6-dev qt6-3d-dev qt6-3d-doc-dev qt6-5compat-dev qt6-base-dev qt6-base-doc-dev \
        qt6-base-private-dev qt6-charts-dev qt6-connectivity-dev qt6-datavis3d-dev qt6-declarative-dev \
        qt6-declarative-doc-dev qt6-declarative-private-dev qt6-graphs-dev qt6-grpc-dev qt6-grpc-doc-dev \
        qt6-httpserver-dev qt6-languageserver-dev qt6-languageserver-private-dev qt6-location-dev \
        qt6-location-doc-dev qt6-lottie-dev qt6-multimedia-dev qt6-networkauth-dev qt6-networkauth-doc-dev \
        qt6-pdf-dev qt6-pdf-private-dev qt6-positioning-dev qt6-positioning-doc-dev qt6-positioning-private-dev \
        qt6-quick3d-dev qt6-quick3d-doc-dev qt6-quick3d-private-dev qt6-quick3dphysics-dev \
        qt6-quickeffectmaker-doc-dev qt6-quicktimeline-dev qt6-remoteobjects-dev qt6-remoteobjects-doc-dev \
        qt6-scxml-dev qt6-scxml-doc-dev qt6-sensors-dev qt6-sensors-doc-dev qt6-serialbus-dev \
        qt6-serialbus-doc-dev qt6-serialport-dev qt6-shadertools-dev qt6-shadertools-doc-dev qt6-speech-dev \
        qt6-svg-dev qt6-svg-doc-dev qt6-svg-private-dev qt6-tools-dev qt6-tools-doc-dev qt6-tools-private-dev \
        qt6-virtualkeyboard-dev qt6-wayland-dev qt6-wayland-private-dev qt6-webchannel-dev qt6-webchannel-doc-dev \
        qt6-webengine-dev qt6-webengine-doc-dev qt6-webengine-private-dev qt6-websockets-dev qt6-websockets-doc-dev \
        qt6-websockets-private-dev qt6-webview-dev qtkeychain-qt6-dev

RUN cd /opensource/desktop && \
        mkdir build && cd build && \
        cmake .. -DCMAKE_BUILD_TYPE=Debug && \
        make -j 4 && \
        make install && ldconfig

RUN echo "/usr/lib/x86_64-linux-gnu/nextcloud/" >> /etc/ld.so.conf.d/x86_64-linux-gnu.conf && ldconfig
