#ifndef USERDAO_H
#define USERDAO_H
#include "user.h"
#include <QtCore>
#include <JQNet>
#include <QList>
#include <core.h>
#include "positem.h"
class UserDao
{
public:
    UserDao();
    static bool grantAgentById(QString agent_id,int agent_type,QString agent_province,QString agent_city,QString agent_county,QString priority_token,QString &respond);
    static bool registerUser(QString username,QString password,QString &respond);
    static bool getUserById(QString id,User &outUser);
    static bool validUser(QString username,QString password,User *outuser);
    static bool updateUser(QString username,QString nickname,QString province,QString city,QString county,QString priority_token,QString &respond);
    static bool queryChildAgents(QList<QObject*> &agents);
    static bool removeAgent(QString agent_id);
    static bool queryPos(int agent,QString name,QStringList  &pos);
};


#endif // USERDAO_H
