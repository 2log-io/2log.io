# 2log.io
The 2log.io server - This is the root repository with all plugins as submodules.


# License Notice

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.
You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

## 3rd party 

### Qt
This software ist mainly based on Qt, the cross platform framework of my choice. It's using the following Qt Modules published under the terms of the LGPL / GPL v.2
- QtCore
- QtNetwork
- QtWebsockets
- QtConcurrent
- QtQuick
- QtWidget
- to be continued

The frontend application (2log.in) is also provided as a WebAssembly compilation. The corresponding QPA WASM plugin from Qt is used under the terms of the GNU General Public License v. 3.

Please visit www.qt.io for further information.

### QtWebApp by Stefan Frings

Many thanks at this point to the great project "QtWebApp" by Stefan Frings (http://stefanfrings.de/qtwebapp/). His Qt based HTTP server is used in several places in 2log.io and does a great job. It's used under the terms of the LGPL.

### SMTP eMail by Tőkés Attila

The integration was smooth and the code allows sending emails via encrypted SMTP.  2log.io uses this great library under the terms of the LGPL. Please read under
https://github.com/bluetiger9/SmtpClient-for-Qtd for further information.



