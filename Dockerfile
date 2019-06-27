FROM ubuntu

RUN echo mail > /etc/hostname

# install
ENV DEBIAN_FRONTEND non-interactive
RUN apt-get update; apt-get install -y postfix postgrey sasl2-bin rsyslog

EXPOSE 25
EXPOSE 587

# Add startup script
ADD startup.sh /opt/startup.sh
RUN chmod a+x /opt/startup.sh

# Docker startup
ENTRYPOINT ["/opt/startup.sh"]
