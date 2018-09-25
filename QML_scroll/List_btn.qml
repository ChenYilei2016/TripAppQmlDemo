import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "qrc:/the_JS/Global.js" as JS

Rectangle{

    property alias text : text.text
    property int btnindex:0
    signal btnSignal(int indexid)

    property bool isPressed: false //控制按的间隔 防止过快

    width: JS.theWidth
    height: JS.dpH(60)
    color: "white"

    //fillwidth

    Text {
        id: text
        text: qsTr("1. 非物质文化遗产...")
        font.bold: true
        font.pixelSize: JS.dpX(18)
        width: self.width
        elide: Text.ElideRight
        anchors.verticalCenter: parent.verticalCenter

    }
    Rectangle{
        id: line
        height: JS.dpH(3)
        width: parent.width
        color: "#3F000000"

        x: 0
        y: JS.dpH(59)
    }
    Rectangle{
        id: line2
        height: JS.dpH(3)
        width: parent.width
        color: "#3F000000"
        radius: JS.dpX(5)

        x: 0
        anchors.top: parent.top
    }
    Button{
        id: btn
        opacity: 0.21
        anchors.fill: parent
        style: ButtonStyle{
            background: Rectangle{
                anchors.fill: parent
                color: control.hovered?"#a0a0a0":"white";
                border.width: control.pressed?2:1;
                border.color: "white";
            }
        }

        //发送 编号信号
        onClicked:{
                btn.enabled = false
                mytimer.start()
                btnSignal(btnindex)
        }
    }

    Timer{
        id: mytimer
        interval: 388;
        triggeredOnStart: false;
        repeat: false
        onTriggered: {
            btn.enabled = true
        }

    }

}
