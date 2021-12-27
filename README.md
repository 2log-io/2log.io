# 2log.io

2log is a free membership management system for workshops, fablabs, maker- and hackerspaces. It is a modular hardware and software solution that digitally links devices, users, processes and makes them remotely trackable. Each device with a power cable - from the laser cutter to the coffee machine - can be connected to your 2log instance with the 2log Switch within a few seconds.

Your advantages:
- Protect your machines from unauthorized use thanks to individual usage
authorizations.
- Bill the machine running time precisely to the second - without bureaucratic overhead.
- Transfer your existing machinery to 2log. No changes to the machines are necessary - the manufacturer‘s warranty for the equipment is retained.
- Reduce your power consumption. Unused machines switch off automatically.
- Receive statistics on the use of your machines. With 2log you can monitor the load in real time. You can see at any time who has been working on which machine when and where.
- Use our app or the web platform to always have a full overview of the processes in your workshop.
- Integrate 2log into your existing systems (e.g. CoBot).
- Bill products like coffee or snacks with a self service terminal. 
- Easy authentication via RFID cards

## How it works 

In order to integrate a machine into 2log, no structural changes need to be made. The 2log switch is simply plugged between the power plug of the machine and the socket. The setup process is so simple that you can easily do it yourself in minutes.

![image](https://user-images.githubusercontent.com/51061627/146942192-8bc52edc-dbaf-4b9d-ba2d-ab2f555302c8.png)

All settings such as price, billing intervals and basic power consumption can be made via the clear and easy-to-use web interface. Special knowledge or expensive trainings are not necessary.

# Setup your own 2log instance

2log is free and open source now. However, as long as there are no official release tags here, the open source version of 2log is still under construction.So there might be some puzzle pieces missing that are needed to run your own 2log instance.   Nevertheless I would be very happy if someone is interested in testing parts of the already released artifacts. Any feedback is highly appreciated! 

## Docker

The easiest way to set up your 2log instance is to use the Dockerfile provided in the repository. 
First, make sure that Docker is installed with the associated tool docker-compose. 

```
mkdir ~/2log
cd 2log
wget https://raw.githubusercontent.com/2log-io/2log.io/main/docker/docker-compose.yaml
docker-compose up
```

By default, the WebAssembly frontend can be reached via Port 8080. If the server is running on your local machine, just visit http://localhost:8080 in your web browser and the UI should come up. You can now login into your instancy by accessing the WebSocket service which is by default accessible via port 4711. To check your instance is up and just type `ws://localhost:4711`. The initial default login is "admin" with passwort "password". 

Note: The frontend does currently _not_ work in mobile browsers. Since the frontend is written in Qt, it can easily be compiled as a native Android *.apk.  (Which is much cooler anyway).

## Hardware 

To take full advantage of 2log, you must have the hardware. But don't worry, the 2log hardware is based on easily obtainable components and can be built by yourself.

### 2log Dot

The 2log Dot is based on ESP32 and the PN532 RFID Card reader and can be easily built by yourself. Check out the appropriate repository (https://github.com/2log-io/2log-dot) for further informations.

### 2log Switch

The firmware we currently provide is based on the Shelly Plug S. However, it can be easily adapted to other sockets of similar design.

# License Notice

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

## 3rd party 
Free software lives from free software. 2log.io would not have been possible without the numerous small and large open source projects that were available to us.

### QuickHub
2log.io is a plugin collection for the QuickHub framework, which I released under the MPL for free use. please see www.quickhub.org for further information.

### Qt
This software ist mainly based on Qt (www.qt.io), the cross platform framework of my choice. It's using the following Qt Modules published under the terms of the LGPL / GPL v.2
- QtCore
- QtNetwork
- QtWebsockets
- QtConcurrent
- QtQuick
- QtWidget
- to be continued

The frontend application (2log.in) is also provided as a WebAssembly compilation. The corresponding QPA WASM plugin from Qt is used under the terms of the GNU General Public License v. 3.

### QtWebApp by Stefan Frings

Many thanks at this point to the great project "QtWebApp" by Stefan Frings (http://stefanfrings.de/qtwebapp/). His Qt based HTTP server is used in several places in 2log.io and does a great job. It's used under the terms of the LGPL.

### SMTP eMail by Tőkés Attila

The integration of SmtpClient-for-Qt (https://github.com/bluetiger9/SmtpClient-for-Qt) was smooth and the code allows sending emails via encrypted SMTP. 2log.io uses this great library under the terms of the LGPL.


