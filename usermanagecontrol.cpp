#include "usermanagecontrol.h"
QList<QObject*> agents;
UserManageControl::UserManageControl(QQmlApplicationEngine &engine)
{
//    Core::user.username = "m839336369";
//    Core::user.id = 839336369;
//    Core::user.nickname = "涯丶";
//    Core::user.password = "m839336369";
//    Core::user.type = 1;
//    Core::user.province = "山西省";
//    Core::user.city = "太原市";
//    Core::user.county = "杏花岭区";
//    Core::user.origin = "12345";
    engine.rootObjects().clear();
    engine.rootContext( )->setContextProperty("userManageWindow",this);
    engine.rootContext( )->setContextProperty("user",QVariant::fromValue(Core::user));
    engine.rootContext()->setContextProperty("agent",QVariant::fromValue(Core::agent));
    const QUrl url(QStringLiteral("qrc:/frame/MainWindow.qml"));
    engine.load(url);
    this->engine = &engine;
    queryChildAgents();
    QMetaObject::invokeMethod(engine.rootObjects()[1]->findChild<QObject*>("userManageFrame"),"init");
}
bool UserManageControl::updateUser(QString username,QString nickname,QString province,QString city,QString county,QString priority_token){
    QString respond;
    if(UserDao::updateUser(username,nickname,province,city,county,priority_token,respond)){
        QMetaObject::invokeMethod(engine->rootObjects()[1]->findChild<QObject*>("msgDialog"),"openMsg",Q_ARG(QVariant,QVariant(respond)),Q_ARG(QVariant,QVariant(0)));
        return true;
    }
    else {
        QMetaObject::invokeMethod(engine->rootObjects()[1]->findChild<QObject*>("msgDialog"),"openMsg",Q_ARG(QVariant,QVariant(respond)),Q_ARG(QVariant,QVariant(3)));
        return false;
    }
}
bool UserManageControl::remove_user(QString agent_id){
    if(UserDao::removeAgent(agent_id)){
        QMetaObject::invokeMethod(engine->rootObjects()[1]->findChild<QObject*>("msgDialog"),"openMsg",Q_ARG(QVariant,QVariant("成功删除")),Q_ARG(QVariant,QVariant(0)));
        QList<QVariant> list = engine->rootObjects()[1]->findChild<QObject*>("users_listView")->property("model").toList();
        int index = engine->rootObjects()[1]->findChild<QObject*>("users_listView")->property("currentIndex").toInt();
        agents.removeAt(index);
        engine->rootObjects()[1]->findChild<QObject*>("users_listView")->setProperty("model",QVariant::fromValue(agents));
        return true;
    }
    else{
        QMetaObject::invokeMethod(engine->rootObjects()[1]->findChild<QObject*>("msgDialog"),"openMsg",Q_ARG(QVariant,QVariant("删除失败")),Q_ARG(QVariant,QVariant(3)));
        return false;
    }
}
bool UserManageControl::queryChildAgents(){
    qDeleteAll(agents);
    agents.clear();
    if(UserDao::queryChildAgents(agents)){
        engine->rootObjects()[1]->findChild<QObject*>("users_listView")->setProperty("model",QVariant::fromValue(agents));
        return true;
    }
    else{
        QMetaObject::invokeMethod(engine->rootObjects()[1]->findChild<QObject*>("msgDialog"),"openMsg",Q_ARG(QVariant,QVariant("代理查询发生未知错误")),Q_ARG(QVariant,QVariant(3)));
        return false;
    }
}
bool UserManageControl::getAgentById(QString id){
    User user;
    if(UserDao::getUserById(id,user)){
        QMetaObject::invokeMethod(engine->rootObjects()[1]->findChild<QObject*>("msgDialog"),"openMsg",Q_ARG(QVariant,QVariant("查询成功")),Q_ARG(QVariant,QVariant(0)));
        Core::agent->setusername(user.username);
        Core::agent->setid(user.id);
        Core::agent->setnickname(user.nickname);
        Core::agent->settype(user.type);
        Core::agent->setprovince(user.province);
        Core::agent->setcity(user.city);
        Core::agent->setcounty(user.county);
        Core::agent->setorigin(user.origin);
        return true;
    }
    else {
        QMetaObject::invokeMethod(engine->rootObjects()[1]->findChild<QObject*>("msgDialog"),"openMsg",Q_ARG(QVariant,QVariant("查询未果")),Q_ARG(QVariant,QVariant(3)));
        return false;
    }
}
bool UserManageControl::grantAgentById(QString agent_id,int agent_type,QString agent_province,QString agent_city,QString agent_county,QString priority_token){
    QString respond;
    if(UserDao::grantAgentById(agent_id,agent_type,agent_province,agent_city,agent_county,priority_token,respond)){
        int flag = true;
        for(int i=0;i<agents.size();i++){
            if(qobject_cast<User*>(agents.at(i))->id == agent_id){
                User *user = qobject_cast<User*>(agents.at(i));
                user->settype(agent_type);
                user->setprovince(agent_province);
                user->setcity(agent_city);
                user->setcounty(agent_county);
                flag = false;
            }
        }
        if(flag){
            User* outUser = new User();
            outUser->id = Core::agent->id;
            outUser->username = Core::agent->username;
            outUser->nickname = Core::agent->nickname;
            outUser->province = Core::agent->province;
            outUser->city = Core::agent->city;
            outUser->county = Core::agent->county;
            outUser->type = Core::agent->type;
            outUser->origin = Core::agent->origin;
            agents.append(outUser);
            engine->rootObjects()[1]->findChild<QObject*>("users_listView")->setProperty("model",QVariant::fromValue(agents));
            engine->rootObjects()[1]->findChild<QObject*>("users_listView")->setProperty("currentIndex",QVariant::fromValue(agents.size()-1));
        }
        QMetaObject::invokeMethod(engine->rootObjects()[1]->findChild<QObject*>("msgDialog"),"openMsg",Q_ARG(QVariant,QVariant(respond)),Q_ARG(QVariant,QVariant(0)));
        return true;
    }
    else{
        QMetaObject::invokeMethod(engine->rootObjects()[1]->findChild<QObject*>("msgDialog"),"openMsg",Q_ARG(QVariant,QVariant(respond)),Q_ARG(QVariant,QVariant(3)));
        return false;
    }
}
bool UserManageControl::queryPos(int type,QString name){
    QStringList list;
    if(UserDao::queryPos(type,name,list)){
        if(type == 0){
            engine->rootObjects()[1]->findChild<QObject*>("choose_county_combox")->setProperty("model",QVariant::fromValue(list));
        }
        else if(type == 1){
            engine->rootObjects()[1]->findChild<QObject*>("choose_city_combox")->setProperty("model",QVariant::fromValue(list));
        }
        else if(type == 2){
            engine->rootObjects()[1]->findChild<QObject*>("choose_province_combox")->setProperty("model",QVariant::fromValue(list));
        }
        return true;
    }
    else{
        QMetaObject::invokeMethod(engine->rootObjects()[1]->findChild<QObject*>("msgDialog"),"openMsg",Q_ARG(QVariant,QVariant("网络出现故障,请重新登录尝试")),Q_ARG(QVariant,QVariant(3)));
        return false;
    }
}
