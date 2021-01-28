import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3

Page {
    id: root
    visible: true
    title: qsTr("中医四诊仪")
    objectName: "userManageFrame"
    UserQueryDialog{
        id:userQueryDialog
    }
    function init(){
        choose_province_combox.model = [user.province]
        choose_city_combox.model = [user.city]
        choose_county_combox.model = [user.county]
        choose_type_comboBox.enabled = false;
        choose_city_combox.enabled = false;
        choose_county_combox.enabled = false;
        choose_province_combox.enabled = false
        if(user.type === 0){

        }
        else if(user.type === 1){
            choose_type_comboBox.enabled = true;
            choose_type_comboBox.model = ["普通用户"]
        }
        else if(user.type === 2){
            choose_county_combox.enabled = true;
            choose_type_comboBox.enabled = true;
            userManageWindow.queryPos(0,user.city);
            choose_type_comboBox.model = ["普通用户","区级代理"]
        }
        else if(user.type === 3){
            choose_type_comboBox.enabled = true;
            choose_city_combox.enabled = true;
            choose_county_combox.enabled = true;
            userManageWindow.queryPos(1,user.province);
            userManageWindow.queryPos(0,choose_city_combox.currentText);
            choose_type_comboBox.model = ["普通用户","区级代理","市级代理"]
        }
        else if(user.type === 4){
            choose_type_comboBox.enabled = true;
            choose_city_combox.enabled = true;
            choose_county_combox.enabled = true;
            choose_province_combox.enabled = true
            userManageWindow.queryPos(2,"Country");
            userManageWindow.queryPos(1,choose_province_combox.currentText);
            userManageWindow.queryPos(0,choose_city_combox.currentText);
            choose_type_comboBox.model = ["普通用户","区级代理","市级代理","省级代理"]
        }
    }

    function type_deconvert(type){
        switch(type){
            case 0:return "普通用户"
            case 1:return "县级代理"
            case 2:return "市级代理"
            case 3:return "省级代理"
            case 4:return "超级用户"
            default:return "空用户权限"
        }
    }
    Label{
        id:name_label
        anchors.verticalCenter:user_list_refresh_button.verticalCenter
        anchors.right: user_list_refresh_button.left
        anchors.left: parent.left
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 15
        font.bold: true
        font.family: "楷体"
        text:" " + user.nickname + ",您好! 您当前的账户权限：" + type_deconvert(user.type)
    }
    Button{
        id:user_list_refresh_button
        anchors.top: parent.top
        anchors.right: childname_label.left
        anchors.rightMargin: 20
        font.pixelSize: 15
        font.bold: true
        font.family: "楷体"
        text: "刷新"
        onClicked: {
            if(userManageWindow.queryChildAgents())msg.openMsg("刷新成功",0);
            else msg.openMsg("刷新失败",3)
        }
    }
    ListView {
        id: users_listView
        objectName: "users_listView"
        anchors.bottom: parent.bottom
        anchors.top:user_list_refresh_button.bottom
        anchors.left: parent.left
        anchors.right: childname_label.left
        rightMargin: 20
        leftMargin: 20
        topMargin: 20
        clip: true
        highlight: Rectangle { color: "lightblue"; radius: 10 ;width: 500}
        delegate:UserItem{}
    }
    Rectangle{
        id:childname_label
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: name_label.top
        border.color: "blue"
        border.width: 1
        anchors.topMargin: 20
        radius: 10
        width: 300
        Row{
            id:childUser_name_layout
            anchors.top:parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: childname_label.horizontalCenter
            Label{
                id:childUser_type_label
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 25
                font.bold: true
                font.family: "楷体"
                text: "[" +type_deconvert(agent.type) + "] "
            }
            Label{
                id:childUser_nickname_label
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 25
                font.bold: true
                font.family: "楷体"
                text: agent.nickname
            }
        }
        Row{
            id:childUser_information_layout
            anchors.top: childUser_name_layout.bottom
            anchors.horizontalCenter: childname_label.horizontalCenter
            anchors.topMargin: 30
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
                text: agent.id
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
                text:agent.username
                font.pixelSize: 13
                font.bold: true
                font.family: "楷体"
            }
        }
        Row{
            id:childUser_location_layout
            anchors.top: childUser_information_layout.bottom
            anchors.horizontalCenter: childname_label.horizontalCenter
            anchors.topMargin: 20
            spacing: 15
            Label{
                id:childUser_province_combox
                text: agent.province
                font.pixelSize: 12
                font.bold: true
                font.family: "楷体"
            }
            Label{
                id:childUser_city_combox
                text: agent.city
                font.pixelSize: 12
                font.bold: true
                font.family: "楷体"
            }
            Label{
                id:childUser_county_combox
                text: agent.county
                font.pixelSize: 12
                font.bold: true
                font.family: "楷体"
            }
        }
        ComboBox{
            id:choose_type_comboBox
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
        Column{
            id:choose_location_layout
            anchors.top: choose_type_comboBox.bottom
            anchors.horizontalCenter: childname_label.horizontalCenter
            anchors.topMargin: 5
            spacing: 5
            Row{
                spacing: 20
                ComboBox{
                    id:choose_province_combox
                    objectName: "choose_province_combox"
                    font.pixelSize: 12
                    font.bold: true
                    font.family: "楷体"
                    onCurrentTextChanged: {
                        userManageWindow.queryPos(1,currentText);
                    }
                }
                ComboBox{
                    id:choose_city_combox
                    objectName:"choose_city_combox"
                    font.pixelSize: 12
                    font.bold: true
                    font.family: "楷体"
                    onCurrentTextChanged: {
                        userManageWindow.queryPos(0,currentText);
                    }
                }
            }
            ComboBox{
                id:choose_county_combox
                objectName: "choose_county_combox"
                width: parent.width
                font.pixelSize: 12
                font.bold: true
                font.family: "楷体"
            }
        }
        Button{
            id:childUser_query_button
            anchors.top:choose_location_layout.bottom
            anchors.horizontalCenter: childname_label.horizontalCenter
            anchors.topMargin: 10
            width: 130
            height: 50
            text: "查询"
            onClicked: {
                userQueryDialog.openMsg("请输入用户账号",1);
            }
        }
        Button{
            id:childUser_save_button
            anchors.top:childUser_query_button.bottom
            anchors.horizontalCenter: childname_label.horizontalCenter
            anchors.topMargin: 20
            width: 130
            height: 50
            text: "授予"
            onClicked: {
                if(userManageWindow.grantAgentById(childUser_user_id_label.text,choose_type_comboBox.currentIndex
                                                   ,choose_province_combox.currentText,choose_city_combox.currentText,choose_county_combox.currentText)){
                    agent.type = choose_type_comboBox.currentIndex;
                    agent.province = choose_province_combox.currentText;
                    agent.city = choose_city_combox.currentText;
                    agent.county = choose_county_combox.currentText;
                }
            }
        }
        Button{
            id:childUser_delete_button
            anchors.top:childUser_save_button.bottom
            anchors.horizontalCenter: childname_label.horizontalCenter
            anchors.topMargin: 20
            width: 130
            height: 50
            text: "删除"
            onClicked: {
                userManageWindow.remove_user(childUser_user_id_label.text);
            }
        }
    }
}
