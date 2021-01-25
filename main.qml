import QtQuick 2.9
import QtQuick.Controls 2.5

ApplicationWindow {
    id: applicationWindow
    width: 300
    height: 400
    visible: true
    title: qsTr("中医四诊仪")
    SwipeView {
        id: swipeui
        anchors.fill: parent
        currentIndex: 1
        RegisterPage{

        }
        LoginPage{

        }
        ForgetPage{

        }
    }

    PageIndicator {
            id:indicator
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            currentIndex: swipeui.currentIndex
            count: swipeui.count
    }
}
