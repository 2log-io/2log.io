FROM frime/quickhub-fablab-runtime
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y tzdata
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
EXPOSE 4711
EXPOSE 8080
ENV LD_LIBRARY_PATH="/2log/lib:/2log/plugins"
COPY result/bin /2log

ENTRYPOINT ["./2log/2log.io", "-f", "/quickhub/"]
