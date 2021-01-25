#ifndef USERMANAGECONTROL_H
#define USERMANAGECONTROL_H
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <user.h>
#include <core.h>
class UserManageControl : QObject
{
    Q_OBJECT
public slots:
    bool update_user(long user_id,int type);
    bool remove_user(long user_id);
public:
    QQmlApplicationEngine *engine;
    UserManageControl(QQmlApplicationEngine &engine);
};

#endif // USERMANAGECONTROL_H
