QT += quick

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
include($$PWD/library/JQLibrary/JQLibrary.pri)
include($$PWD/library/NetDao/NetDao.pri)
SOURCES += \
        core.cpp \
        logincontrol.cpp \
        main.cpp \
        positem.cpp \
        user.cpp \
        usermanagecontrol.cpp
RESOURCES += qml.qrc \
    image.qrc

TRANSLATIONS += \
    Cure_Client_zh_CN.ts

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    core.h \
    logincontrol.h \
    positem.h \
    user.h \
    usermanagecontrol.h

DISTFILES += \
    library/JQLibrary/JQLibrary.pri \
    library/NetDao/NetDao.pri
