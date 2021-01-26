#ifndef LOGINCONTROL_H
#define LOGINCONTROL_H
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <usermanagecontrol.h>
#include "userdao.h"
#include "user.h"
class LoginControl : QObject
{
    Q_OBJECT
public slots:
    bool login_click(QString username,QString password);
    bool registerUser(QString username,QString password);
public:
    QQmlApplicationEngine *engine;
    LoginControl(QQmlApplicationEngine &engine);
};

#endif // LOGINCONTROL_H
