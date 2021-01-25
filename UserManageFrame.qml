import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
Page {
    id: root
    visible: true
    title: qsTr("中医四诊仪")
    Row{
        id:user_layout
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 30
        anchors.leftMargin: 100
        Label{
            id:name_label
            wrapMode: "WordWrap"
            font.pixelSize: 18
            font.bold: true
            font.family: "楷体"
            text:"涯"
        }
        Label{
            font.pixelSize: 15
            font.bold: true
            font.family: "楷体"
            text: ",您好！"
        }
        Label{
            font.pixelSize: 15
            font.bold: true
            font.family: "楷体"
            text: "     您当前的账户权限："
        }
        Label{
            id:priority_label
            font.pixelSize: 15
            font.bold: true
            font.family: "楷体"
            text: "省级代理"
        }
    }
    ListView {
        id: users_listView
        anchors.bottom: parent.bottom
        anchors.top:user_layout.bottom
        anchors.left: parent.left
        rightMargin: 20
        leftMargin: 20
        topMargin: 20
        width: 500
        clip: true
        highlight: Rectangle { color: "lightblue"; radius: 10 }
        model:users_model
        delegate: UserItem{}
    }
    Rectangle{
        id:childUser_layout
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: user_layout.top
        width: 300
        border.color: "blue"
        border.width: 5
        Label{
            id:childUser_nickname_label
            anchors.top:parent.top
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 50
            font.pixelSize: 25
            font.bold: true
            font.family: "楷体"
            text: "涯丶"
        }
        Row{
            id:childUser_information_layout
            anchors.top: childUser_nickname_label.bottom
            anchors.horizontalCenter: childUser_layout.horizontalCenter
            anchors.topMargin: 60
            height: 30
            spacing: 20
            Label{
                text: "ID:"
                font.pixelSize: 13
                font.bold: true
                font.family: "楷体"
            }
            Label{
                id:childUser_user_id_label
                text: "839336369"
                font.pixelSize: 13
                font.bold: true
                font.family: "楷体"
            }
            Label{
                text: "账户:"
                font.pixelSize: 13
                font.bold: true
                font.family: "楷体"
            }
            Label{
                id:childUser_username_label
                text: "m839336369"
                font.pixelSize: 13
                font.bold: true
                font.family: "楷体"
            }
        }
        Row{
            id:childUser_location_layout
            anchors.top: childUser_information_layout.bottom
            anchors.horizontalCenter: childUser_layout.horizontalCenter
            anchors.topMargin: 30
            spacing: 15
            Label{
                id:childUser_province_label
                text: "山西省"
                font.pixelSize: 12
                font.bold: true
                font.family: "楷体"
            }
            Label{
                id:childUser_city_label
                text: "太原市"
                font.pixelSize: 12
                font.bold: true
                font.family: "楷体"
            }
            Label{
                id:childUser_county_label
                text: "杏花岭区"
                font.pixelSize: 12
                font.bold: true
                font.family: "楷体"
            }
        }
        ComboBox{
            id:childUser_type_ComboBox
            anchors.top: childUser_location_layout.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.topMargin: 30
            model:["普通用户","县级代理","市级代理","省级代理","超级用户"]
            font.pixelSize: 12
            font.bold: true
            font.family: "楷体"
            currentIndex: 0
        }
        Button{
            id:childUser_query_button
            anchors.top:childUser_type_ComboBox.bottom
            anchors.horizontalCenter: childUser_layout.horizontalCenter
            anchors.topMargin: 30
            width: 130
            height: 50
            text: "添加"
        }
        Button{
            id:childUser_save_button
            anchors.top:childUser_query_button.bottom
            anchors.horizontalCenter: childUser_layout.horizontalCenter
            anchors.topMargin: 30
            width: 130
            height: 50
            text: "保存"
            onClicked: {

            }
        }
        Button{
            id:childUser_delete_button
            anchors.top:childUser_save_button.bottom
            anchors.horizontalCenter: childUser_layout.horizontalCenter
            anchors.topMargin: 30
            width: 130
            height: 50
            text: "删除"
            onClicked: {
                var data = users_listView.model.get(users_listView.currentIndex)
                if(userManageWindow.remove_user(childUser_user_id_label.text)){
                    users_listView.model.remove(users_listView.currentIndex);
                    msg.openMsg(0,"删除成功")
                }
                else {
                    msg.openMsg(3,"删除失败")
                }
            }
        }
    }
    MsgDialog{
        id:msg
    }

    ListModel{
        id:users_model;//model对象中 有数组ListElement 存储所有的列表数据对象
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}
        ListElement{user_id:1;username:12345;nickname:"5";type:0;county:"杏花岭区";city:"太原市";province:"山西省"}

    }

}
