import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.LocalStorage 2.12
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
    // 程序打开时，初始化表
    function initialize() {
        var db = getDatabase();
        db.transaction(
            function(tx) {
                tx.executeSql('CREATE TABLE IF NOT EXISTS agents(username TEXT UNIQUE,password TEXT)');
          });
    }
    function getUserInformation(){
        var db = getDatabase();
        var result;
        db.transaction(
            function(tx) {
                result = tx.executeSql('SELECT * FROM agents');
          });
        return result;
    }
    function insertUserInformation(username,password){
        var db = getDatabase();
        var result;
        db.transaction(
            function(tx,result) {
                tx.executeSql('DELETE FROM agents');
                tx.executeSql('INSERT INTO agents VALUES(?,?)',[username,password]);
          });
        return result;
    }

    function getDatabase() {
         return LocalStorage.openDatabaseSync("agents", "1.0", "代理数据库", 100000);
    }


    PageIndicator {
            id:indicator
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            currentIndex: swipeui.currentIndex
            count: swipeui.count
    }
    MsgDialog{
        id:msg
        objectName: "msgDialog"
    }
}
