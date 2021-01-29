#ifndef USER_H
#define USER_H
#include<Qt>
#include<QString>
#include<QObject>
class User : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString id READ getid WRITE setid NOTIFY idChanged)
    Q_PROPERTY(QString username READ getusername WRITE setusername NOTIFY usernameChanged)
    Q_PROPERTY(QString nickname READ getnickname WRITE setnickname NOTIFY nicknameChanged)
    Q_PROPERTY(int type READ gettype WRITE settype NOTIFY typeChanged)
    Q_PROPERTY(QString county READ getcounty WRITE setcounty NOTIFY countyChanged)
    Q_PROPERTY(QString city READ getcity WRITE setcity NOTIFY cityChanged)
    Q_PROPERTY(QString province READ getprovince WRITE setprovince NOTIFY provinceChanged)
    Q_PROPERTY(QString origin READ getorigin WRITE setorigin NOTIFY originChanged)
    Q_PROPERTY(QString priority_token READ getpriority_token WRITE setpriority_token NOTIFY priority_tokenChanged)
public:
    User();
    QString id;
    QString username;
    QString nickname;
    int type;
    QString county;
    QString city;
    QString province;
    QString origin;
    QString token;
    QString getid();
    QString priority_token;
    void setid(const QString &id);

    QString getusername();
    void setusername(const QString &username);

    QString getnickname();
    void setnickname(const QString &nickname);

    int gettype();
    void settype(const qlonglong &type);

    QString getcounty();
    void setcounty(const QString &county);

    QString getcity();
    void setcity(const QString &city);

    QString getprovince();
    void setprovince(const QString &province);

    QString getorigin();
    void setorigin(const QString &origin);

    QString getpriority_token();
    void setpriority_token(const QString &priority_token);
signals:
    void idChanged();
    void usernameChanged();
    void nicknameChanged();
    void typeChanged();
    void countyChanged();
    void cityChanged();
    void provinceChanged();
    void originChanged();
    void priority_tokenChanged();
};
#endif // USER_H
