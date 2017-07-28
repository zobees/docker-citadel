FROM zobees/steamcmd
MAINTAINER cliffrowley@gmail.com

USER root

RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get install -y xdg-utils

ENV STEAM_APP_ID="489650" \
    STEAM_APP_ANONYMOUS="1" \
    CITADEL_DIR="/citadel"

COPY files/server.sh /server.sh

RUN mkdir -p $CITADEL_DIR && \
    chmod 755 /server.sh && \
    chmod +x /home/steam/Steam/steamcmd.sh \
    chmod +x /home/steam/Steam/linux32/steamcmd

RUN useradd -ms /bin/bash citadel

WORKDIR $CITADEL_DIR

USER citadel

VOLUME $CITADEL_DIR

CMD /server.sh
