FROM dreadnterrible/timechaincalendar

# arm64 or amd64
ARG PLATFORM
ARG ARCH

# ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/*.sh
