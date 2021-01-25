#ifndef LOGINCONTROL_H
#define LOGINCONTROL_H
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <usermanagecontrol.h>
class LoginControl : QObject
{
    Q_OBJECT
public slots:
    void login_click(QString username,QString password);
public:
    QQmlApplicationEngine *engine;
    LoginControl(QQmlApplicationEngine &engine);
};

#endif // LOGINCONTROL_H
