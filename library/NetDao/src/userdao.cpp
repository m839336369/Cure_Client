#include "userdao.h"
#include "QString"
UserDao::UserDao()
{

}
bool UserDao::getUserById(long id,User &outUser){
    const auto &&reply = JQNet::HTTP::post("https://www.yixiangame.top:28015", "hello");
    qDebug() << "HTTPS post reply:" << reply.first << reply.second;
    return true;
}
bool UserDao::validUser(QString username,QString password,User &outUser){
    QJsonObject data;
    data.insert("head","ValidUser");
    data.insert("username",username);
    data.insert("password",password);
    const bool reply = JQNet::HTTP::post("https://www.yixiangame.top:28015",data);
    if(reply){
        if(data.contains("head")){
            QStringList heads = QString(data.value("head").toString()).split(QString("|"),Qt::KeepEmptyParts,Qt::CaseSensitive);
            if(heads.length() == 1 && heads[0] == "ValidUser"){
                if(data.value("result").toBool()){
                    outUser.id = data.value("id").toString().toLongLong();
                    outUser.username = data.value("username").toString();
                    outUser.nickname = data.value("nickname").toString();
                    outUser.province = data.value("province").toString();
                    outUser.city = data.value("city").toString();
                    outUser.county =data.value("county").toString();
                    outUser.type = data.value("type").toInt();
                    outUser.origin = data.value("origin").toString().toLongLong();
                    return true;
                }
            }
        }
    }
    return false;
}
bool UserDao::registerUser(QString username,QString password,QString &respond){
    QJsonObject data;
    data.insert("head","RegisterUser");
    data.insert("username",username);
    data.insert("password",password);
    const bool reply = JQNet::HTTP::post("https://www.yixiangame.top:28015",data);
    if(reply){
        if(data.contains("head")){
            QStringList heads = QString(data.value("head").toString()).split(QString("|"),Qt::KeepEmptyParts,Qt::CaseSensitive);
            if(heads.length() == 1 && heads[0] == "RegisterUser" && data.contains("result") && data.contains("respond")){
                respond = data.value("respond").toString();
                if(data.value("result").toBool()){
                    return true;
                }
            }
        }
    }
    return false;
}

bool UserDao::updateUser(QString username,QString nickname,QString password,QString province,QString city,QString county){
    return true;
}
