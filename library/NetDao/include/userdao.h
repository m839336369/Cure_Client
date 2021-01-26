#ifndef USERDAO_H
#define USERDAO_H
#include "user.h"
#include <QtCore>
#include <JQNet>
class UserDao
{
public:
    UserDao();
    static bool registerUser(QString username,QString password,QString &respond);
    static bool getUserById(long id,User &outUser);
    static bool validUser(QString username,QString password,User &outuser);
    static bool updateUser(QString username,QString nickname,QString password,QString province,QString city,QString county);
};


#endif // USERDAO_H
