#ifndef USERMANAGECONTROL_H
#define USERMANAGECONTROL_H
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <user.h>
#include <core.h>
#include <userdao.h>
class UserManageControl : QObject
{
    Q_OBJECT
public slots:
    bool getAgentById(QString id);
    bool grantAgentById(QString agent_id,int agent_type,QString name,QString agent_province,QString agent_city,QString agent_county);
    bool updateUser(QString username,QString nickname,QString province,QString city,QString county);
    bool remove_user(QString user_id);
    bool queryChildAgents();
    bool queryPos(int type,QString name);
public:
    QQmlApplicationEngine *engine;
    QList<QObject*> agents;
    UserManageControl(QQmlApplicationEngine &engine);
};

#endif // USERMANAGECONTROL_H
