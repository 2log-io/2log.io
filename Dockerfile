FROM frime/2log-buildenv
EXPOSE 4711
EXPOSE 8080
ENV LD_LIBRARY_PATH="/2log/lib:/2log/plugins"
COPY result/bin /2log

ENTRYPOINT ["./2log/2log.io", "-f", "/quickhub/"]
