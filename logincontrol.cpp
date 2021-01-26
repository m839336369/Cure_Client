#include "logincontrol.h"

LoginControl::LoginControl(QQmlApplicationEngine &engine)
{
    const QUrl url(QStringLiteral("qrc:/frame/main.qml"));
    engine.load(url);
    engine.rootContext( )->setContextProperty("loginControl",this);
    this->engine = &engine;
}
bool LoginControl::login_click(QString username,QString password){
    User user;
    if(UserDao::validUser(username,password,user)){
        Core::user = user;
        UserManageControl* control = new UserManageControl(*engine);
        return true;
    }
    else {
        return false;
    }
}
bool LoginControl::registerUser(QString username,QString password){
    QString respond;
    if(UserDao::registerUser(username,password,respond)){

        QMetaObject::invokeMethod(engine->rootObjects()[0]->findChild<QObject*>("msgDialog"),"openMsg",Q_ARG(QVariant,QVariant(respond)),Q_ARG(QVariant,QVariant(0)));
        return true;
    }
    else {
        QMetaObject::invokeMethod((engine->rootObjects()[0]->findChild<QObject*>("msgDialog")),"openMsg",Q_ARG(QVariant,QVariant(respond)),Q_ARG(QVariant,QVariant(3)));
        return false;
    }
}
