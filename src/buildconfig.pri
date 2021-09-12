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


# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.

#DEFINES += QT_DEPRECATED_WARNINGS

CONFIG      += plugin
TEMPLATE    = lib
INCLUDEPATH += src
DESTDIR = ../bin/plugins

# QuickHub Core
INCLUDEPATH += ../quickhub-core/src
LIBS += -lQHCore -L"../bin/plugins"

# QuickHub PluginSystem
INCLUDEPATH += ../quickhub-pluginsystem/src
LIBS += -lQHPluginSystem -"L../bin/lib"

# 2log Core
INCLUDEPATH     += ../2log-core/src
LIBS            += -l2log-core -L"../bin/plugins"
CONFIG += c++17
