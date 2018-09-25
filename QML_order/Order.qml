import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 2.2 as C2

import 'qrc:/QML_ready'
import "qrc:/the_JS/Global.js" as JS

Rectangle{
    id: self

    property var place_list:JS.place_list
    property var detail_list: JS.detail_list
    property string theTitle:'报名预约'

    TopHeader{
        id: topheader
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        text: theTitle
        isMain: false
    }
    Rectangle{
        id: temprect

        anchors.top:topheader.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        Image{
            anchors.fill: parent
            source: 'qrc:/Images/sky.jpeg'
            asynchronous: true
            smooth: true
        }

        Text{
            id: text_time
            font.bold: true
            text: '选择报名时间:'
            color: '#f8000080'
            font.pixelSize: JS.dpX(20)
            anchors.left: parent.left
            anchors.leftMargin:JS.dpW(20)
            anchors.top:parent.top
            anchors.topMargin: JS.dpH(10)
        }

        C2.ComboBox{
            id: combox_time
            model:['暂无']
            width:JS.dpW(310)
            height: JS.dpH(30)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:text_time.bottom
            anchors.topMargin: JS.dpH(10)

        }


        Rectangle{
            width: JS.theWidth-JS.dpW(18)
            height: JS.dpH(1.5)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:combox_time.bottom
            anchors.topMargin: JS.dpH(5)
            color: '#8fa8a8a8'
        }

        Text{
            id: text_place
            font.bold: true
            text: '选择活动地点:'
            color: '#f8000080'
            font.pixelSize: JS.dpX(20)
            anchors.left: parent.left
            anchors.leftMargin:JS.dpW(20)
            anchors.top:combox_time.bottom
            anchors.topMargin: JS.dpH(15)
        }

        C2.ComboBox{
            id: combox_place
            anchors.horizontalCenter: parent.horizontalCenter
            width: JS.dpW(310)
            height: JS.dpH(30)
            model: place_list
            onCurrentIndexChanged:{
                if(currentIndex ==0 ){
                    combox_detail.model = ['选择技艺']
                }
                else{
                    combox_detail.model = detail_list[currentIndex]
                }
            }

            anchors.top:text_place.bottom
            anchors.topMargin: JS.dpH(10)

        }
        C2.ComboBox{
            id: combox_detail
            width: JS.dpW(310)
            height: JS.dpH(30)
            anchors.horizontalCenter: parent.horizontalCenter
            model: ['选择技艺']
            anchors.top:combox_place.bottom
            anchors.topMargin: JS.dpH(10)

        }
        Rectangle{
            width: JS.theWidth-JS.dpW(18)
            height: JS.dpH(1.5)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:combox_detail.bottom
            anchors.topMargin: JS.dpH(15)
            color: '#8fa8a8a8'
        }

        Text{
            id: text_my
            font.bold: true
            text: '填写相关信息:'
            color: '#f8000080'
            font.pixelSize: JS.dpX(20)
            anchors.left: parent.left
            anchors.leftMargin:JS.dpW(20)
            anchors.top:combox_detail.bottom
            anchors.topMargin: JS.dpH(30)
        }

        TextField{
            id: textf_name
            placeholderText: '请填写姓名!'
            width: JS.dpW(310)
            height: JS.dpH(28)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: text_my.bottom
            anchors.topMargin: JS.dpH(15)
            font.bold: true
            style: TextFieldStyle{
                background: Rectangle{
                    color:'transparent'
                    border.color:'#8f888888'
                    radius: JS.dpX(6)
                }
            }
        }

        TextField{
            id: textf_id
            placeholderText: '请填写身份证!'
            width: JS.dpW(310)
            height: JS.dpH(28)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: textf_name.bottom
            anchors.topMargin: JS.dpH(15)
            font.bold: true
            style: TextFieldStyle{
                background: Rectangle{
                    color:'transparent'
                    border.color:'#8f888888'
                    radius: JS.dpX(6)
                }
            }
        }
        TextField{
            id: textf_tel
            placeholderText: '请填写联系方式!(QQ,手机号码)'
            width: JS.dpW(310)
            height: JS.dpH(28)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: textf_id.bottom
            anchors.topMargin: JS.dpH(15)
            font.bold: true
            style: TextFieldStyle{
                background: Rectangle{
                    color:'transparent'
                    border.color:'#8f888888'
                    radius: JS.dpX(6)
                }
            }
        }
        TextField{
            id: textf_other
            placeholderText: '其他备注信息.'
            width: JS.dpW(310)
            height: JS.dpH(28)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: textf_tel.bottom
            anchors.topMargin: JS.dpH(15)
            font.bold: true
            style: TextFieldStyle{
                background: Rectangle{
                    color:'transparent'
                    border.color:'#8f888888'
                    radius: JS.dpX(6)
                }
            }
        }

        Text{
            id: sale
            text:'预约报名费用:       XXX$'
            font.bold:true
            font.pixelSize: JS.dpX(25)
            anchors.top:textf_other.bottom
            anchors.topMargin: JS.dpH(20)
            anchors.left: parent.left
            anchors.leftMargin: JS.dpW(25)
        }

        Button{
            id: ok_btn
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: sale.bottom
            anchors.topMargin: JS.dpH(25)
            width: JS.dpW(150)
            height: JS.dpH(40)
            style: ButtonStyle{
                background: Rectangle{
                    radius: JS.dpX(20)
                    color: control.hovered?"#8fa0a0a0":"transparent";
                    Image{
                        source: 'qrc:/QML_order/images/ok_btn.png'
                        anchors.fill: parent
                        sourceSize: Qt.size(JS.dpW(150),JS.dpH(80) )
                        asynchronous: true
                    }
                }
            }
            onClicked: {
                msg_animation.start()
            }
        }
    }
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
