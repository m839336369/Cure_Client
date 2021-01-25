#ifndef USER_H
#define USER_H
#include<Qt>
#include<QString>
#include<QObject>
class User : QObject
{
public:
    User();
    long id;
    QString username;
    QString nickname;
    QString password ;
    int type;
    QString county;
    QString city;
    QString province;
    QString origin;
};

#endif // USER_H
