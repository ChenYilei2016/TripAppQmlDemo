import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import "qrc:/the_JS/Global.js" as JS
import 'qrc:/the_JS/Fun.js' as FUN
Rectangle {
    property string messagex_text : ''
    signal loginOk()
    signal register()
    Button{
        anchors.top: parent.top
        anchors.right: parent.right
        width: JS.dpW(45)
        height: JS.dpH(45)
        z:200
        style:ButtonStyle{
            background: Rectangle{
                id: temprect
                z: 300
                anchors.fill: parent
                color: control.hovered?"#8fa0a0a0":"transparent";
                Image{
                    anchors.fill: temprect
                    asynchronous: true
                    source:'qrc:/Images/Login/theQuit.png'
                    sourceSize: Qt.size(JS.dpW(45),JS.dpH(45))
                }
            }
        }

        onClicked:{
            Qt.quit()
        }
    }
    Rectangle{ // 背景图
        id: bg_rect;
        anchors.fill: parent;
        color: "#ecedf1";
        z: 0;
    }

    Image{
        source: "qrc:/Images/Login/MainLogin.png"
        anchors.fill: parent
        asynchronous: true
        z: 20
    }

    Image{
        source: 'qrc:/Images/Login/LOGO.png'
        sourceSize: Qt.size(JS.dpW(240),JS.dpH(170))
        anchors.horizontalCenter: parent.horizontalCenter
        asynchronous: true
        z: 20
        y: JS.dpH(45)
    }


    TextField{

        id :username_TF;

        x: JS.dpW(85);
        y: JS.dpH(255);
        z: 1;
        width: 3* JS.theWidth / 5
        height: JS.dpH(30);

        placeholderText: "输入账号";
        style:TextFieldStyle{
            background: Rectangle {
                color: "transparent";
            }
        }
    }

    TextField{
        id :password_TF;
        x: JS.dpW(85);
        y: JS.dpH(315);
        z: 1;
        width: 3* JS.theWidth / 5
        height: JS.dpH(30);
        echoMode: 2;
        placeholderText: "输入密码";
        style:TextFieldStyle{
            background: Rectangle {
                color: "transparent";
            }
        }

    }

    Button{ //登陆
        id: btn_in
        x: JS.dpW(52)
        y: JS.dpH(393)
        width: JS.dpW(256)
        height: JS.dpH(45)
        z:200
        style:ButtonStyle{
            background: Rectangle{
                z: 300
                anchors.fill: parent
                color: control.hovered?"#8fa0a0a0":"transparent";
            }
        }
        //loginOk()
        onClicked:{
            clientSocket.setUserid_pass(username_TF.text , password_TF.text); //设置信息
            clientSocket.start();
            //loginOk();//登陆成功的消息
        }
    }

    Button{ //注册
        id: btn_r
        x: JS.dpW(52)
        y: JS.dpH(450)
        width: JS.dpW(256)
        height: JS.dpH(45)
        z:200
        style:ButtonStyle{
            background: Rectangle{
                z: 300
                anchors.fill: parent
                color: control.hovered?"#8fa0a0a0":"transparent";
            }
        }
        onClicked:{
            //注册账号
            register()
        }
    }

    BusyIndicator{
        id: busybtn
        anchors.centerIn: parent
        visible: false

    }

    Connections{
        target: clientSocket
        onWaitforConnected:{
            if( true == iswait){
                busybtn.visible = true;
            }
            else{
                busybtn.visible = false;
            }
        }

        onNotFoundNet:{
            //没有网络
            messagex_text = '连接网络失败!'
            msg_animation.start()
        }
    }

    Rectangle{
        id:msg_rect;
        radius: JS.dpX(20);
        z: 10;
        width: JS.dpW(150);
        height: JS.dpH(30);
        color:"black";
        opacity:0;
        anchors.centerIn: parent;
        Text{
            anchors.centerIn: parent;
            text:messagex_text
            color: "white";
            font.pixelSize: JS.dpX(15);
            z:10;
        }

    }
    SequentialAnimation{
        id:msg_animation;

        NumberAnimation {
            target: msg_rect;
            property: "opacity";
            duration: 1000;
            to:100;
            easing.type: Easing.InCubic;
        }
        NumberAnimation {
            target: msg_rect;
            property: "opacity";
            duration: 1000;
            to:100;
            easing.type: Easing.InOutQuad;
        }
        NumberAnimation {
            target: msg_rect;
            property: "opacity";
            duration: 1000;
            to:0;
            easing.type: Easing.InOutQuad;
        }

    }

}
