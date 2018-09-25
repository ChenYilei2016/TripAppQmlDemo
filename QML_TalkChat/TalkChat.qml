import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import "qrc:/the_JS/Global.js" as JS
import 'qrc:/QML_ready'
Rectangle{
    id: self
    visible: true

    property string theTitle:'平台聊天室'


    Image{
        source: 'qrc:/Images/sky.jpeg'
        anchors.fill: parent
        z: 0
    }
    TopHeader{
        id: topheader
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        text: theTitle
        isMain: false
    }

    //主聊天显示框
    Rectangle{
        id: chat
        anchors.top:topheader.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: 'transparent'

        anchors.leftMargin: JS.dpW(5)
        anchors.rightMargin: JS.dpW(5)
        anchors.topMargin: JS.dpH(5)
        anchors.bottomMargin: JS.dpH(5)

        radius: JS.dpX(10)
        border.color: '#af888888'

        //用户1
        Rectangle{
            color: 'transparent'
            x: JS.dpW(20)
            y: JS.dpH(20)
            width: JS.dpW(310)
            height: JS.dpH(60)

            Rectangle{
                color: 'transparent'
                border.color: '#8fa8a8a8'
                anchors.fill: image1
                radius: image1.height/2
            }
            Image{
                id: image1
                source: 'qrc:/QML_TalkChat/images/head1.png'
                asynchronous: true
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                sourceSize: Qt.size(JS.dpW(66),JS.dpH(66))
            }
            Text{
                id: t1
                text: '用户one 3-29 9:03 :'
                anchors.top: parent.top
                anchors.topMargin: JS.dpH(5)
                anchors.left:image1.right
                font.family: '宋体'
                font.bold: true
                font.pixelSize: JS.dpX(16)
            }
            Text {
                text: qsTr("    我觉的这个app将来会变得更好")
                wrapMode: Text.Wrap
                font.bold: true
                font.pixelSize: JS.dpX(16)
                anchors.left: image1.right
                anchors.top: t1.bottom
            }
        }

        //用户2
        Rectangle{
            color: 'transparent'
            x: JS.dpW(20)
            y: JS.dpH(85)
            width: JS.dpW(310)
            height: JS.dpH(60)
            Rectangle{
                color: 'transparent'
                border.color: '#8fa8a8a8'
                anchors.fill: image2
                radius: image2.height/2
            }
            Image{
                id: image2
                source: 'qrc:/QML_TalkChat/images/head2.png'
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                sourceSize: Qt.size(JS.dpW(66),JS.dpH(66))
                asynchronous: true
            }
            Text{
                id: t2
                text: '用户two 3-29 9:25:'
                anchors.top: parent.top
                anchors.topMargin: JS.dpH(5)
                anchors.left:image2.right
                font.family: '宋体'
                font.bold: true
                font.pixelSize: JS.dpX(16)
            }
            Text {
                text: qsTr("    我也是这么觉的哈哈~~~")
                wrapMode: Text.Wrap
                font.bold: true
                font.pixelSize: JS.dpX(16)
                anchors.left: image2.right
                anchors.top: t2.bottom
            }
        }

    }



    //底部输入框
    Rectangle{
        id: bottomrect
        anchors.bottom: self.bottom
        anchors.left: self.left
        anchors.right: self.right
        anchors.rightMargin: JS.dpW(5)
        anchors.leftMargin: JS.dpW(5)
        anchors.bottomMargin: JS.dpH(5)

        width: self.width
        height: JS.dpH(45)
        radius: JS.dpX(10)
        border.color: 'black'
        color: 'transparent'



        TextField{
            id: textfield
            width: bottomrect.width*0.70
            height: bottomrect.height *0.68
            focus: true

            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: JS.dpW(10)
            font.bold:true

            style:TextFieldStyle{
                background: Rectangle {
                    color: "transparent";
                    border.color: '#9fa8a8a8'
                    radius: JS.dpX(6)

                }
            }
        }

        Button {
            id: text
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: textfield.right
            anchors.right: parent.right
            anchors.rightMargin: JS.dpW(5)
            anchors.leftMargin: JS.dpW(5)
            width: bottomrect.width *0.21
            height: bottomrect.height *0.56
            style: ButtonStyle{
                background: Rectangle{
                    color: 'transparent'
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("发送消息")
                        font.bold: true
                        font.family: '华文新魏'
                        font.pixelSize: JS.dpX(20)
                    }
                }
            }

            onClicked: {
                msg_animation.start()
            }
        }


    }


      //消息框
    Rectangle{
        id:msg_rect;
        radius: JS.dpX(20);
        z: 10;
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
    //动画
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
