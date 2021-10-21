#   2log.io
#   Copyright (C) 2021 - 2log.io | mail@2log.io,  mail@friedemann-metzger.de
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU Affero General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU Affero General Public License for more details.
#
#   You should have received a copy of the GNU Affero General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.

TEMPLATE = subdirs
CONFIG += ordered
QMAKE_LFLAGS += -Wl,-rpath,"'$$ORIGIN'"
SUBDIRS += quickhub-pluginsystem/QHPluginSystem.pro \
           quickhub-core/QHCore.pro \
           2log-core/2log-core.pro \
           2log-paydesk/2log-paydesk.pro \
           2log-cobot/2log-cobot.pro \
           2log-servicehelper/2log-servicehelper.pro \
           2log-services/2log-services.pro \
           quickhub-rest/QHRest.pro \
           main/main.pro
