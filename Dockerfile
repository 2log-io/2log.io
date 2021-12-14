FROM frime/2log-buildenv
EXPOSE 4711
EXPOSE 8080
ENV LD_LIBRARY_PATH="/2log/lib:/2log/plugins"
COPY result/bin /2log
# Download wasm UI
RUN wget -c https://gitlab.com/Frime/2log-in/-/jobs/artifacts/main/download?job=build_2logAdminApp -O artifacts.zip
RUN apt-get install unzip
RUN unzip artifacts.zip && rm artifacts.zip
RUN mv result wasm-ui
ENV HTTP_DOCROOT="/wasm-ui"
ENV QUICKLAB_DATA_DIR="/quickhub/"
ENTRYPOINT ["./2log/2log.io", "-f", "/quickhub/"]
