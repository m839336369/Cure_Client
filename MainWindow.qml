import QtQuick 2.0
import QtQuick.Controls 2.12

ApplicationWindow {
    id: root
    width: 800
    height: 640
    visible: true
    title: qsTr("中医四诊仪")
    MsgDialog{
        id:msg
        objectName: "msgDialog"
    }
    TabBar{
        id:menu_tab
        anchors.top: parent.top
        width:parent.width
        height: 50
        TabButton{
            text:qsTr("Personal");
        }
        TabButton{
            text:qsTr("Agent");
        }
        currentIndex: content_swip.currentIndex
    }

    SwipeView {
        id:content_swip
        width: parent.width
        currentIndex: menu_tab.currentIndex
        anchors.top: menu_tab.bottom
        anchors.bottom:parent.bottom
        PersonalProfileFrame{

        }
        UserManageFrame{

        }
    }
}
