import QtQuick 2.0
import QtQuick.Controls 2.5
Page {
    id:root
    Label{
            id: login_label
            text: "用户登陆"
            font.bold: true
            font.family: "楷体"
            font.pixelSize: 28
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 50
        }
    Label {
        id: login_username_label
        text: qsTr("账户")
        anchors.right: login_label.horizontalCenter
        anchors.top: login_label.bottom
        horizontalAlignment: Text.horizontalCenter
        font.pixelSize: 20
        font.bold: true
        anchors.topMargin: 50
        anchors.rightMargin: 60
        font.family: "楷体"
    }

    TextField {
        id: login_username_text
        placeholderText: qsTr("Text Field")
        font.pixelSize: 15
        anchors.topMargin: -10
        anchors.leftMargin: -30
        font.bold: true
        font.family: "楷体"
        anchors.top: login_username_label.top
        anchors.left: login_label.horizontalCenter
    }

    Label {
        id: login_password_label
        horizontalAlignment: Text.horizontalCenter
        text: qsTr("密码")
        anchors.horizontalCenter: login_username_label.horizontalCenter
        anchors.top: login_username_label.bottom
        font.pixelSize: 20
        font.bold: true
        anchors.topMargin: 30
        font.family: "楷体"
    }

    TextField {
        id: login_password_text
        placeholderText: qsTr("Text Field")
        font.pixelSize: 12
        anchors.topMargin: 15
        font.bold: true
        font.family: "楷体"
        echoMode: "Password"
        anchors.top: login_username_text.bottom
        anchors.left: login_username_text.left
    }
    Button{
        id:login_login_button
        anchors.top:login_password_label.bottom
        anchors.horizontalCenter: login_label.horizontalCenter
        anchors.topMargin: 60
        text: "登陆"
        width: 120
        onClicked: {
            loginControl.login_click(login_username_text.text,login_password_text.text)
            close()
        }
    }
}
