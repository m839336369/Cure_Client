#ifndef POSITEM_H
#define POSITEM_H
#include<QObject>

class PosItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString pos READ getpos WRITE setpos NOTIFY posChanged)
public:
    PosItem();
    QString pos;
    QString getpos();
    void setpos(const QString &pos);
signals:
    void posChanged();
};

#endif // POSITEM_H
