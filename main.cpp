#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQuickItem>
#include <QQuickView>
#include <QDebug>
#include <logincontrol.h>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    LoginControl* login = new LoginControl(engine);
    qputenv( "QT_SSL_USE_TEMPORARY_KEYCHAIN", "1" );

    return app.exec();
}
