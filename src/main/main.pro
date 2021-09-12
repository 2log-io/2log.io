TEMPLATE = app

TARGET = 2log.io

INCLUDEPATH += ../quickhub-pluginsystem/src
QT += core websockets qml
LIBS += -lQHPluginSystem -L../bin/lib -ldl
LIBS += -lQHCore -L../bin/plugins
DESTDIR = ../bin
SOURCES += \
    main.cpp

INSTALLS += target
HEADERS += \
        death_handler.h

SOURCES += \
        death_handler.cc
