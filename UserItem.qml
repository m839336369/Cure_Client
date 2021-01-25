import QtQuick 2.0
import QtQuick.Controls 2.5
ItemDelegate {
    width: 500
    height: 30
    highlighted: ListView.isCurrentItem
    onClicked: {
        users_listView.currentIndex = index
        childUser_user_id_label.text = user_id
        childUser_nickname_label.text = nickname
        childUser_username_label.text = username
        childUser_type_ComboBox.currentIndex = type
        childUser_province_label.text = province
        childUser_city_label.text = city
        childUser_county_label.text = county
    }

    Row{
        width: parent.width
        spacing: 18
        Label{
            text: username
        }
        Label{
            text: nickname
        }
        Label{
            text: type_deconvert(type)
        }
        Label{
            text:province
        }
        Label{
            text:city
        }
        Label{
            text:county
        }


    }
    function type_deconvert(type){
        switch(type){
            case 0:return "普通用户"
            case 1:return "县级代理"
            case 2:return "市级代理"
            case 3:return "省级代理"
            case 4:return "超级用户"
        }
    }
}
