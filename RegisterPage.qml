import QtQuick 2.0
import QtQuick.Controls 2.5
Page {
    id:root
    Label{
            id: register_label
            text: "用户注册"
            font.bold: true
            font.family: "楷体"
            font.pixelSize: 28
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 50
        }
    Label {
        id: register_username_label
        text: qsTr("账户")
        horizontalAlignment: Text.horizontalCenter
        anchors.right: register_label.horizontalCenter
        anchors.top: register_label.bottom
        font.pixelSize: 20
        font.bold: true
        anchors.topMargin: 50
        anchors.rightMargin: 60
        font.family: "楷体"
    }

    TextField {
        id: register_username_text
        placeholderText: qsTr("Text Field")
        font.pixelSize: 15
        anchors.topMargin: -10
        anchors.leftMargin: -30
        font.bold: true
        font.family: "楷体"
        anchors.top: register_username_label.top
        anchors.left: register_label.horizontalCenter
    }

    Label {
        id: register_password_label
        text: qsTr("密码")
        horizontalAlignment: Text.horizontalCenter
        anchors.horizontalCenter: register_username_label.horizontalCenter
        anchors.top: register_username_label.bottom
        font.pixelSize: 20
        font.bold: true
        anchors.topMargin: 30
        font.family: "楷体"
    }

    TextField {
        id: register_password_text
        placeholderText: qsTr("Text Field")
        font.pixelSize: 12
        anchors.topMargin: 15
        font.bold: true
        echoMode: "Password"
        font.family: "楷体"
        anchors.top: register_username_text.bottom
        anchors.left: register_username_text.left
    }
    Label {
        id: register_again_label
        text: qsTr("确认密码")
        horizontalAlignment: Text.horizontalCenter
        anchors.horizontalCenter: register_username_label.horizontalCenter
        anchors.top: register_password_label.bottom
        font.pixelSize: 20
        font.bold: true
        anchors.topMargin: 30
        font.family: "楷体"
    }

    TextField {
        id: register_again_text
        placeholderText: qsTr("Text Field")
        font.pixelSize: 12
        anchors.topMargin: 15
        font.bold: true
        font.family: "楷体"
        echoMode: "Password"
        anchors.top: register_password_text.bottom
        anchors.left: register_password_text.left
    }

    Button{
        id:register_register_button
        anchors.top:register_again_label.bottom
        anchors.horizontalCenter: register_label.horizontalCenter
        anchors.topMargin: 30
        text: "注册"
        width: 120
    }
}
