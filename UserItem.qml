import QtQuick 2.0
import QtQuick.Controls 2.5
ItemDelegate {
    width: 450
    height: 30
    highlighted: ListView.isCurrentItem
    onClicked: {
        users_listView.currentIndex = index
        agent.id = id_item.text
        agent.nickname = nickname_item.text
        agent.username = username_item.text
        agent.type = type_convert(type_item.text)
        agent.province = province_item.text
        agent.city = city_item.text
        agent.county = county_item.text
    }
    Row{
        spacing: 10
        width: parent.width
        height: 30
        Label{
            id:id_item
            width: 50
            height: 30
            text: model.modelData.id
            visible: false
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Label{
            width: 100
            height: 30
            id:username_item
            text: model.modelData.username
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Label{
            id:nickname_item
            text: model.modelData.nickname
            width: 80
            height: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Label{
            id:type_item
            text: type_deconvert(model.modelData.type)
            width: 50
            height: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Label{
            id:province_item
            text:model.modelData.province
            width: 50
            height: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Label{
            id:city_item
            text:model.modelData.city
            width: 50
            height: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Label{
            id:county_item
            text:model.modelData.county
            width: 50
            height: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
    function type_deconvert(type){
        switch(type){
            case 0:return "普通用户"
            case 1:return "县级代理"
            case 2:return "市级代理"
            case 3:return "省级代理"
            case 4:return "超级用户"
            default:return "空用户权限"
        }
    }
    function type_convert(type){
        switch(type){
            case "普通用户":return 0
            case "县级代理":return 1
            case "市级代理":return 2
            case "省级代理":return 3
            case "超级用户":return 4
            default:msg.openMsg("权限错误");
        }
    }
}
