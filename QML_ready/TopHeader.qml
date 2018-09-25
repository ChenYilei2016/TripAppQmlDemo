import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2 as C2


import "qrc:/the_JS/Global.js" as JS
import 'qrc:/the_JS/Fun.js' as FUN
import "qrc:/QML_TopDrawer"


//"#3F51B5" 颜色

Rectangle{

    property bool  isMain : false  //是不是在主页面
    property alias text : text.text
    property bool canUse : true
    signal back_signal //按下了返回按钮 主页面出栈
    signal setting()

    color: "#3F51B5"

    width: JS.theWidth
    height: JS.dpH(60)

    Row{
        spacing: JS.dpW(16)
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: JS.dpW(10)

        Button{
            id: btn
            width: JS.dpW(30)
            height: JS.dpH(30)
            enabled: canUse

            style: ButtonStyle{
                background: Rectangle{
                    id: backrect
                    radius: backrect.width/2
                    width: JS.dpW(32)
                    height: JS.dpH(32)
                    Image{ //可以替换成 button
                        id: image
                        source: {
                            if(isMain)
                                return "qrc:/Images/TopHeader/maintop.png"
                            else
                                return "qrc:/Images/TopHeader/back_btn.png"
                        }
                        sourceSize: Qt.size(width,height)
                        anchors.fill: backrect
                    }
                    color:{
                        if(control.pressed){
                            return '#a0a0a0'
                        }
                        else
                            return 'transparent'
                    } //control.hovered?"#a0a0a0":"transparent";
                    border.width: control.pressed?2:1;
                    border.color: "transparent";
                }
            }

            onClicked: {
                if(isMain){
                }
                else{ //子页面可以返回
                    keyFilter.sig_KeyBackPress()
                }
            }
        }

        Text {
            id: text
            text: qsTr("非物质文化遗产-传统技艺观赏")
            font.pixelSize: JS.dpX(18)
            font.family: "微软雅黑"
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    Rectangle{
        id: myset
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: JS.dpW(5)
        color: 'transparent'
        width: JS.dpW(30)
        height: JS.dpH(30)
        radius: JS.dpX(18)
        Image{
            source: 'qrc:/Images/TopHeader/setting_open.png'
            anchors.fill: parent
            sourceSize: Qt.size(JS.dpW(30),JS.dpH(30))
        }
        MouseArea{
            id: area
            anchors.fill: parent
            onClicked: {
                setting()
                drawer.open()
            }

        }
    }


    //抽屉窗口2D2F3E
    C2.Drawer {
            id: drawer
            edge: Qt.LeftEdge
            width: parent.width * 0.60
            height: JS.theHeight
            opacity: 0.99

            //背景色
            Rectangle{
                color:'#2B2F3E'
                anchors.fill: parent
            }

            User{
                id: user
                width: drawer.width
                height: 0.3 * drawer.height
                anchors.top: drawer.top

                MouseArea{
                    width: 0.8*user.width
                    height: 0.5 * user.height
                    anchors.centerIn: parent
                    onClicked: {
                        drawer.close()
                        setting_animation.start()
                    }
                }
            }

            Column{
                id: col
                anchors.top: user.bottom

                MyItemDelegate{
                    source : 'qrc:/Images/TopHeader/maintop.png'
                    showtext: '首页'
                    onClicked:{
                        drawer.close()
                        FUN.toMain()
                    }
                }
                MyItemDelegate{
                    showtext: '个人资料'
                    source : 'qrc:/QML_TopDrawer/images/myThing.png'
                    onClicked:{
                        drawer.close()
                        setting_animation.start()
                    }
                }
                MyItemDelegate{
                    showtext: '帮助信息'
                    source:'qrc:/Images/MainMenu/Help.png'
                    onClicked:{
                        drawer.close()
                        JS.theStackview.push( Qt.createComponent('qrc:/QML_Help/Scroll_Help.qml') )
                    }
                }
                MyItemDelegate{
                    showtext: '系统设置'
                    source:'qrc:/QML_TopDrawer/images/System.png'
                    onClicked:{
                        drawer.close()
                        setting_animation.start()
                    }
                }
                MyItemDelegate{
                    showtext: '注销账号'
                    source:'qrc:/Images/Login/theQuit.png'
                    onClicked:{
                        FUN.toMain()
                        JS.theStackview.push('qrc:/QML_ready/UserLogin.qml')
                        drawer.close()
                    }

                }

            }




    }
    Rectangle{
        id:setting_rect;
        radius: JS.dpX(20);
        z: 100;
        width: JS.dpW(130);
        height: JS.dpH(30);
        color:"black";
        opacity:0;
        anchors.centerIn: parent;
        Text{
            anchors.centerIn: parent;
            text:qsTr("后续会完善哦~");
            color: "white";
            font.pixelSize: JS.dpX(15);
            z:10;
        }

    }
    //提示动画
    SequentialAnimation{
        id:setting_animation;

        NumberAnimation {
            target: setting_rect;
            property: "opacity";
            duration: 1000;
            to:100;
            easing.type: Easing.InCubic;
        }
        NumberAnimation {
            target: setting_rect;
            property: "opacity";
            duration: 1000;
            to:100;
            easing.type: Easing.InOutQuad;
        }
        NumberAnimation {
            target: setting_rect;
            property: "opacity";
            duration: 1000;
            to:0;
            easing.type: Easing.InOutQuad;
        }

    }
}
