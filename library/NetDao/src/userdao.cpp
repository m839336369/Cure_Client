#include "userdao.h"
#include "QString"
UserDao::UserDao()
{

}
bool UserDao::getUserById(QString id,User &outUser){
    QJsonObject data;
    data.insert("head","GetUserById");
    data.insert("user_id",id);
    const bool reply = JQNet::HTTP::post("https://www.yixiangame.top:28015",data);
    if(reply){
        if(data.contains("result")){
            if(data.value("result").toBool()){
                outUser.id = data.value("id").toString();
                outUser.username = data.value("username").toString();
                outUser.nickname = data.value("nickname").toString();
                outUser.province = data.value("province").toString();
                outUser.city = data.value("city").toString();
                outUser.county =data.value("county").toString();
                outUser.type = data.value("type").toInt();
                outUser.origin = data.value("origin").toString();
                return true;
            }
        }
    }
    return false;
}
bool UserDao::validUser(QString username,QString password,User *outUser){
    QJsonObject data;
    data.insert("head","ValidUser");
    data.insert("username",username);
    data.insert("password",password);
    const bool reply = JQNet::HTTP::post("https://www.yixiangame.top:28015",data);
    if(reply){
        if(data.contains("result")){
            if(data.value("result").toBool()){
                outUser->id = data.value("id").toString();
                outUser->username = data.value("username").toString();
                outUser->nickname = data.value("nickname").toString();
                outUser->province = data.value("province").toString();
                outUser->city = data.value("city").toString();
                outUser->county =data.value("county").toString();
                outUser->type = data.value("type").toInt();
                outUser->origin = data.value("origin").toString();
                outUser->token = data.value("token").toString();
                return true;
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
        if(data.contains("result") && data.contains("respond")){
            respond = data.value("respond").toString();
            if(data.value("result").toBool()){
                return true;
            }
        }
    }
    return false;
}

bool UserDao::updateUser(QString username,QString nickname,QString province,QString city,QString county,QString &respond){
    QJsonObject data;
    data.insert("head","UpdateUser");
    data.insert("username",username);
    data.insert("nickname",nickname);
    data.insert("province",province);
    data.insert("city",city);
    data.insert("county",county);
    const bool reply = JQNet::HTTP::post("https://www.yixiangame.top:28015",data);
    if(reply){
        if(data.contains("result") && data.contains("respond")){
            respond = data.value("respond").toString();
            if(data.value("result").toBool()){
                return true;
            }
        }
    }
    return false;
}
bool UserDao::queryChildAgents(QList<QObject*> &agents){
    QJsonObject data;
    QJsonArray array;
    data.insert("head","QueryChildAgents");
    const bool reply = JQNet::HTTP::post("https://www.yixiangame.top:28015",data,array);
    if(reply){
        for(int i=0;i<array.size();i++){
            User* outUser = new User();
            const QJsonObject &obj = array.at(i).toObject();
            outUser->id = obj.value("id").toString();
            outUser->username = obj.value("username").toString();
            outUser->nickname = obj.value("nickname").toString();
            outUser->province = obj.value("province").toString();
            outUser->city = obj.value("city").toString();
            outUser->county =obj.value("county").toString();
            outUser->type = obj.value("type").toInt();
            outUser->origin = obj.value("origin").toString();
            agents<<outUser;
        }
        return true;
    }
    return false;
}
bool UserDao::grantAgentById(QString agent_id,int agent_type,QString &respond){
    QJsonObject data;
    data.insert("head","GrantAgent");
    data.insert("agent_id",agent_id);
    data.insert("agent_type",agent_type);
    const bool reply = JQNet::HTTP::post("https://www.yixiangame.top:28015",data);
    if(reply){
        if(data.contains("result") && data.contains("respond")){
            respond = data.value("respond").toString();
            if(data.value("result").toBool()){
                return true;
            }
        }
    }
    return false;
}
bool UserDao::removeAgent(QString agent_id){
    QJsonObject data;
    data.insert("head","RemoveAgent");
    data.insert("agent_id",agent_id);
    const bool reply = JQNet::HTTP::post("https://www.yixiangame.top:28015",data);
    if(reply){
        if(data.contains("result")){
            if(data.value("result").toBool()){
                return true;
            }
        }
    }
    return false;
}
