FROM timechaincalendar/self-hosted:latest

# arm64 or amd64
ARG PLATFORM
ARG ARCH

ENV REACT_APP_MEMPOOL_WEBSOCKET_URL=

RUN apk add --no-cache curl jq yq 
RUN apk add --no-cache apache2 apache2-utils

# Copy custom Apache configuration snippet
ADD assets/compat/custom-httpd.conf /usr/local/bin/custom-httpd.conf
ADD assets/compat/.htaccess ./.htaccess
ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/*.sh && chmod a+x /usr/bin/yq

# Append custom configuration to the main Apache configuration file
RUN echo "Include /usr/local/bin/custom-httpd.conf" >> /etc/apache2/httpd.conf
