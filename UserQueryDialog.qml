import QtQuick 2.6
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    id: root
    anchors.centerIn: parent
    //提示框颜色
    property string backGroundColor: "white"
    property Item parentItem : Rectangle {}

    //Dialog header、contentItem、footer之间的间隔默认是12
    // 提示框的最小宽度是 100
    width: 250
    height: 300
    Dialog {
        id: dialog
        width: root.width
        height: root.height
        modal: true
        background: Rectangle {
            color: backGroundColor
            anchors.fill: parent
            radius: 5
        }
        header: Rectangle {
            width: dialog.width
            border.color: backGroundColor
            Image {
                id:img
                anchors.centerIn: parent.top
            }
        }
        contentItem: Rectangle {
            border.color: backGroundColor
            color: backGroundColor
            Text {
                id:msg
                anchors.horizontalCenter:parent.horizontalCenter
                anchors.top:parent.top
                anchors.topMargin: 50
                font.family: "Microsoft Yahei"
                color: "gray"
                font.pixelSize: 20
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            TextField{
                id:content_text
                anchors.top: msg.bottom
                anchors.topMargin: 50
                width: root.width
                anchors.horizontalCenter:parent.horizontalCenter
                font.family: "Microsoft Yahei"
                color: "gray"
                font.pixelSize: 15
                placeholderText:"请输入用户名"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
        footer: Rectangle {
            width: msg.width
            height: 50
            border.color: backGroundColor
            color: backGroundColor
            radius: 5
            Button {
                anchors.centerIn: parent
                width: 80
                height: 30
                background: Rectangle {
                    anchors.centerIn: parent
                    width: 80
                    height: 30
                    radius: 5
                    border.color: "#0f748b"
                    border.width: 2
                    color: backGroundColor
                    Text {
                        anchors.centerIn: parent
                        font.family: "Microsoft Yahei"
                        font.bold: true
                        color: "#0f748b"
                        text: "OK"
                    }
                }
                onClicked: {
                    dialog.close()
                    userManageWindow.getAgentById(content_text.text);
                }
            }
        }
    }

    function openMsg(message,type) {
        switch(type){
        case 0:img.source="/sucess.png";break;
        case 1:img.source="/information.png";break;
        case 2:img.source="/alert.png";break;
        case 3:img.source="/error.png";break;
        }
        msg.text=message
        root.x = (parent.width - dialog.width) * 0.5
        root.y = (parent.height - dialog.height) * 0.5
        dialog.open();
    }
}
