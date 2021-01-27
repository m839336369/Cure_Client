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
}
bool UserManageControl::updateUser(QString username,QString nickname,QString province,QString city,QString county){
    QString respond;
    if(UserDao::updateUser(username,nickname,province,city,county,respond)){
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
bool UserManageControl::grantAgentById(QString agent_id,int agent_type){
    QString respond;
    if(UserDao::grantAgentById(agent_id,agent_type,respond)){
        int flag = true;
        for(int i=0;i<agents.size();i++){
            if(qobject_cast<User*>(agents.at(i))->id == agent_id){
                qobject_cast<User*>(agents.at(i))->settype(agent_type);
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
            QList<QVariant> list = engine->rootObjects()[1]->findChild<QObject*>("users_listView")->property("model").toList();
            list<<QVariant::fromValue(outUser);
            engine->rootObjects()[1]->findChild<QObject*>("users_listView")->setProperty("model",QVariant::fromValue(list));
        }
        QMetaObject::invokeMethod(engine->rootObjects()[1]->findChild<QObject*>("msgDialog"),"openMsg",Q_ARG(QVariant,QVariant(respond)),Q_ARG(QVariant,QVariant(0)));
        return true;
    }
    else{
        QMetaObject::invokeMethod(engine->rootObjects()[1]->findChild<QObject*>("msgDialog"),"openMsg",Q_ARG(QVariant,QVariant(respond)),Q_ARG(QVariant,QVariant(3)));
        return false;
    }
}
