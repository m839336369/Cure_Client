#ifndef USER_H
#define USER_H
#include<Qt>
#include<QString>
#include<QObject>
class User
{
public:
    User();
    qlonglong id;
    QString username;
    QString nickname;
    QString password ;
    int type;
    QString county;
    QString city;
    QString province;
    qlonglong origin;
};

#endif // USER_H
