#include "user.h"

User::User()
{

}

QString User::getid(){
    return id;
}

void User::setid(const QString &id){
    this->id = id;
    emit idChanged();
}

QString User::getusername(){
    return username;
}

void User::setusername(const QString &username){
    this->username = username;
    emit usernameChanged();
}

QString User::getnickname(){
    return  nickname;
}

void User::setnickname(const QString &nickname){
    this->nickname = nickname;
    emit nicknameChanged();
}

int User::gettype(){
    return type;
}

void User::settype(const qlonglong &type){
    this->type = type;
    emit typeChanged();
}

QString User::getcounty(){
    return county;
}

void User::setcounty(const QString &county){
    this->county = county;
    emit countyChanged();
}

QString User::getcity(){
    return city;
}
void User::setcity(const QString &city){
    this->city = city;
    emit cityChanged();
}

QString User::getprovince(){
    return province;
}

void User::setprovince(const QString &province){
    this->province = province;
    emit provinceChanged();
}

QString User::getorigin(){
    return origin;
}

void User::setorigin(const QString &origin){
    this->origin = origin;
    emit originChanged();
}

QString User::getpriority_token(){
    return priority_token;
}

void User::setpriority_token(const QString &priority_token){
    this->priority_token = priority_token;
    emit originChanged();
}
