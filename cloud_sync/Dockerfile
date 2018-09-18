FROM searchathing/rdp

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN echo 'umask 0007' >> ~/.bashrc

COPY Nextcloud-2.3.3-x86_64.AppImage /tmp
RUN /tmp/Nextcloud-2.3.3-x86_64.AppImage --appimage-extract && mv squashfs-root /root/nextcloud && rm -f /tmp/Nextcloud-2.3.3-x86_64.AppImage
RUN apt-get install -y xvfb

COPY root /root/root-p
RUN echo "root:`cat /root/root-p`" | chpasswd && rm -f /root/root-p && mkdir /root/Desktop

COPY rerun.sh /root
COPY NextCloud.desktop /root/Desktop
COPY cloud-sync-entrypoint.sh /entrypoint.d
RUN chmod +x /root/rerun.sh
