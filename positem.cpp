#include "positem.h"

PosItem::PosItem()
{

}
QString PosItem::getpos(){
    return pos;
}
void PosItem::setpos(const QString &pos){
    this->pos = pos;
    emit posChanged();
}
