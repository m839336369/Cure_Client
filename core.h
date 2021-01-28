#ifndef CORE_H
#define CORE_H
#include "user.h"
class Core
{
public:
    Core();
    static User* user;
    static User* agent;
    static QList<QString> province;
    static QList<QString> city;
    static QList<QString> county;
};

#endif // CORE_H
