#include "usermanagecontrol.h"
UserManageControl::UserManageControl(QQmlApplicationEngine &engine)
{
    const QUrl url(QStringLiteral("qrc:/frame/MainWindow.qml"));
    engine.load(url);
    Core::user.username = "m839336369";
    Core::user.id = 839336369;
    Core::user.nickname = "涯丶";
    Core::user.password = "m839336369";
    Core::user.type = 1;
    Core::user.province = "山西省";
    Core::user.city = "太原市";
    Core::user.county = "杏花岭区";
    Core::user.origin = "12345";
    engine.rootContext( )->setContextProperty("userManageWindow",this);
    engine.rootContext( )->setContextProperty("user_id",QVariant::fromValue(Core::user.id));
    engine.rootContext( )->setContextProperty("username",QVariant::fromValue(Core::user.username));
    engine.rootContext( )->setContextProperty("nickname",QVariant::fromValue(Core::user.nickname));
    engine.rootContext( )->setContextProperty("password",QVariant::fromValue(Core::user.password));
    engine.rootContext( )->setContextProperty("type",QVariant::fromValue(Core::user.type));
    engine.rootContext( )->setContextProperty("province",QVariant::fromValue(Core::user.province));
    engine.rootContext( )->setContextProperty("city",QVariant::fromValue(Core::user.city));
    engine.rootContext( )->setContextProperty("county",QVariant::fromValue(Core::user.county));
    this->engine = &engine;
}
bool UserManageControl::update_user(long user_id,int type){
    return false;
}
bool UserManageControl::remove_user(long user_id){
    return true;
}
