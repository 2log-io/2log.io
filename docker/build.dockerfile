FROM ubuntu:latest AS build-environment

#install Qt and dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y qt5-default  libqt5websockets5-dev  qtdeclarative5-dev cmake curl gnupg git build-essential libssl-dev libsasl2-dev tzdata qml-module-qtquick2 qml-module-qtqml-statemachine

RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Install  mongo-c-driver

RUN apt-get install -y build-essential libssl-dev libsasl2-dev wget
RUN wget https://github.com/mongodb/mongo-c-driver/releases/download/1.17.0/mongo-c-driver-1.17.0.tar.gz && tar xzf mongo-c-driver-1.17.0.tar.gz
RUN cd mongo-c-driver-1.17.0 && mkdir cmake-build
RUN cd mongo-c-driver-1.17.0/cmake-build && cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF .. 
RUN cd mongo-c-driver-1.17.0/cmake-build && make -j8 && make install

#Install mongo-cxx-driver
RUN apt-get install -y python-dev
RUN git clone https://github.com/mongodb/mongo-cxx-driver.git --branch releases/stable --depth 1
RUN cd mongo-cxx-driver/build && cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..  
RUN cd mongo-cxx-driver/build && make EP_mnmlstc_core
RUN cd mongo-cxx-driver/build && make -j4 && make install
RUN cp /usr/local/lib/libmongocxx.so._noabi /usr/lib && cp /usr/local/lib/libbsoncxx.so._noabi /usr/lib

FROM build-environment AS build-2log
COPY . /root
RUN mkdir /root/build
RUN cd /root/build && qmake /root/src/2log.io.pro DEFINES+=DOCKER && make -j4

EXPOSE 4711
EXPOSE 8080
ENV LD_LIBRARY_PATH="/root/build/bin/lib:/root/build/bin/plugins"
ENTRYPOINT ["./root/build/bin/2log.io", "-f", "/quickhub/"]

# build QuickHub

