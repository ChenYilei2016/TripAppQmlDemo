import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import Qt.labs.settings 1.0

import "qrc:/the_JS/Global.js" as JS
import 'qrc:/QML_ready'

ApplicationWindow {
    visible: true
    width: 360
    height:640
    title: qsTr("朝花夕拾")
    id: self

    //系统设置
    Settings{
        id: settings
        category: "ThePublic"
        property var _username :['admin']
        property var _userid:['a']
        property var _userpass:['a']

    }

    Component.onCompleted:{
        //初始化全局 安卓比例

        JS.theWidth = 360  //Screen.width //
        JS.theHeight= 640  //Screen.height//
        JS.multiplierH = JS.theHeight/640
        JS.multiplierW = JS.theWidth/360
        JS.theSetting = settings
    }

    //主体
    Loader{
        id: mainLoader
        anchors.fill: parent
        source: 'qrc:/QML_ready/SplashStart.qml'
    }

    Connections{
        id: mainConnection
        target: mainLoader.item
        ignoreUnknownSignals: true
        onHide:{
            //登陆界面
            mainLoader.source = 'qrc:/QML_ready/UserLogin.qml'
        }
        onRegister:{
            //注册界面

        }
        onLoginOk:{
            //主菜单的页面
            mainLoader.source = 'qrc:/QML_ready/MainMenu.qml'
        }

    }
}
