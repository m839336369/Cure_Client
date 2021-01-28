import QtQuick 2.12
import QtQuick.Controls 2.12
Page {
    id: root
    visible: true
    title: qsTr("中医四诊仪")
    TextField{
        id:user_nickname_textField
        anchors.top:parent.top
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        width: 300
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 50
        font.pixelSize: 25
        font.bold: true
        font.family: "楷体"
        text: user.nickname
    }
    Rectangle{
        id:user_information_layout
        anchors.top: user_nickname_textField.bottom
        width: parent.width
        anchors.topMargin: 30
        Label{
            id:user_user_id_label
            text: "ID:"
            font.pixelSize: 13
            font.bold: true
            font.family: "楷体"
            anchors.topMargin: 10
            anchors.right: user_user_id_show_label.left
            anchors.top: parent.top
        }
        TextField{
            id:user_user_id_show_label
            text: user.id
            enabled: false
            anchors.right: parent.horizontalCenter
            anchors.top: parent.top
            anchors.rightMargin: 50
            font.pixelSize: 13
            font.bold: true
            font.family: "楷体"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            placeholderText:qsTr("请输入您的昵称")
        }
        Label{
            id:user_username_label
            text: "账户:"
            anchors.left: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.leftMargin: 50
            font.pixelSize: 13
            font.bold: true
            font.family: "楷体"
        }
        TextField{
            id:user_username_textField
            text: user.username
            anchors.left: user_username_label.right
            anchors.top: parent.top
            font.pixelSize: 13
            font.bold: true
            font.family: "楷体"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            placeholderText:qsTr("请输入您的账号")
        }
    }
    Row{
        id:user_location_layout
        anchors.top: user_information_layout.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 60
        spacing: 15
        TextField{
            id:user_province_textField
            text: user.province
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            enabled: false
            font.pixelSize: 12
            font.bold: true
            font.family: "楷体"
        }
        TextField{
            id:user_city_textField
            text: user.city
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            enabled: false
            font.pixelSize: 12
            font.bold: true
            font.family: "楷体"
        }
        TextField{
            id:user_county_textField
            text: user.county
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            enabled: false
            font.pixelSize: 12
            font.bold: true
            font.family: "楷体"
        }
    }
    ComboBox{
        id:user_type_ComboBox
        anchors.top: user_location_layout.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.topMargin: 30
        enabled: false
        model:["普通用户","县级代理","市级代理","省级代理","超级用户"]
        font.pixelSize: 12
        font.bold: true
        font.family: "楷体"
        currentIndex: user.type
    }
    Button{
        id:user_query_button
        anchors.top:user_type_ComboBox.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 30
        width: 200
        height: 50
        text: "保存"
        onClicked: {
            userManageWindow.updateUser(user_username_textField.text,user_nickname_textField.text
                                        ,user_province_textField.text,user_city_textField.text,user_county_textField.text)
        }
    }
}
