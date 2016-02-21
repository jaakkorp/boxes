TEMPLATE = app

# Will build the final executable in the main project directory.
TARGET = ../boxes

CONFIG += qt c++14
QT += quick widgets

SOURCES += main.cpp \
    settings.cpp

RESOURCES += \
    ../resources.qrc

target.path = .
INSTALLS += target

HEADERS += \
    settings.h
