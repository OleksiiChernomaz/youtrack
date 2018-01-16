FROM alpine:3.7

RUN export YOU_TRACK_VERSION=2017.4.38399 \
    && apk add --no-cache --upgrade \
           ca-certificates \
           unzip \
           wget \
    && cd /tmp/ \
#install youtrack
&& wget https://download.jetbrains.com/charisma/youtrack-${YOU_TRACK_VERSION}.zip \
    && unzip youtrack-${YOU_TRACK_VERSION}.zip -d ./ \
    && mv ./youtrack-${YOU_TRACK_VERSION} /var/lib/youtrack \
    && rm ./youtrack-${YOU_TRACK_VERSION}.zip \
#install JRE
&& apk add --no-cache openjdk8="8.151.12-r0" \
    && echo "export JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk/jre" >> /etc/profile.d/java.sh \
    && echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> /etc/profile.d/java.sh \
    && chmod a+x /etc/profile.d/java.sh \
    && /etc/profile.d/java.sh \
#some cleanup
&& apk del \
    wget \
    unzip

WORKDIR /var/lib/youtrack
EXPOSE 8081

CMD ["/var/lib/youtrack/bin/youtrack.sh", "run"]
