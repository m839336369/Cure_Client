import QtQuick 2.0
import QtQuick.Controls 2.5
    Page {
    id:root
    Label{
            id: forget_label
            text: "找回密码"
            font.bold: true
            font.family: "楷体"
            font.pixelSize: 28
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 50
        }
    Label {
        id: forget_username_label
        text: qsTr("账户")
        horizontalAlignment: Text.horizontalCenter
        anchors.right: forget_label.horizontalCenter
        anchors.top: forget_label.bottom
        font.pixelSize: 20
        font.bold: true
        anchors.topMargin: 50
        anchors.rightMargin: 60
        font.family: "楷体"
    }

    TextField {
        id: forget_username_text
        placeholderText: qsTr("Text Field")
        font.pixelSize: 15
        anchors.topMargin: -10
        anchors.leftMargin: -30
        font.bold: true
        font.family: "楷体"
        anchors.top: forget_username_label.top
        anchors.left: forget_label.horizontalCenter
    }

    Label {
        id: forget_password_label
        text: qsTr("验证码")
        horizontalAlignment: Text.horizontalCenter
        anchors.horizontalCenter: forget_username_label.horizontalCenter
        anchors.top: forget_username_label.bottom
        font.pixelSize: 20
        font.bold: true
        anchors.topMargin: 30
        font.family: "楷体"
    }

    TextField {
        id: forget_password_text
        placeholderText: qsTr("Text Field")
        font.pixelSize: 15
        anchors.topMargin: 15
        font.bold: true
        font.family: "楷体"
        anchors.top: forget_username_text.bottom
        anchors.left: forget_username_text.left
    }
    Label {
        id: forget_again_label
        text: qsTr("新密码")
        horizontalAlignment: Text.horizontalCenter
        anchors.horizontalCenter: forget_username_label.horizontalCenter
        anchors.top: forget_password_label.bottom
        font.pixelSize: 20
        font.bold: true
        anchors.topMargin: 30
        font.family: "楷体"
    }

    TextField {
        id: forget_sure_text
        placeholderText: qsTr("Text Field")
        font.pixelSize: 12
        anchors.topMargin: 15
        font.bold: true
        font.family: "楷体"
        echoMode: "Password"
        anchors.top: forget_password_text.bottom
        anchors.left: forget_password_text.left
    }
    Button{
        id:forget_forget_button
        anchors.top:forget_again_label.bottom
        anchors.horizontalCenter: forget_label.horizontalCenter
        anchors.topMargin: 30
        text: "重置"
        width: 120
    }
}
