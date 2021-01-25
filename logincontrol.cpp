#include "logincontrol.h"

LoginControl::LoginControl(QQmlApplicationEngine &engine)
{
    const QUrl url(QStringLiteral("qrc:/frame/main.qml"));
    engine.load(url);
    engine.rootContext( )->setContextProperty("loginControl",this);
    this->engine = &engine;
}
void LoginControl::login_click(QString username,QString password){
    UserManageControl* control = new UserManageControl(*engine);
    qDebug()<<username<<" "<<password;
}
