
import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import "qrc:/the_JS/Global.js" as JS

Rectangle{

    width: JS.dpW(150)
    height: JS.dpH(125)
    radius: JS.dpX(15)
    color: "#88888888"

    property alias sourcesize : tempimage.sourceSize
    property int imageindex:0
    property alias text :mytext.text
    property alias image:tempimage.source
    signal image_signal(int imageindex)

    Timer{
        id: waittimer
        repeat: false
        running: false
        interval: 700
        onTriggered: {
            area.enabled = true
        }
    }

    Text {
        id: mytext
        text: qsTr("制陶技艺")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: JS.dpH(10)
        anchors.horizontalCenter: parent.horizontalCenter
        font.bold: true
    }

    //弄image
    Image{
        id: tempimage
        source: ""
        anchors.top: parent.top
        anchors.topMargin: JS.dpH(5)
        anchors.horizontalCenter: parent.horizontalCenter
        asynchronous: true
        sourceSize: Qt.size(parent.width*3/5,parent.height*2/3)
    }

    MouseArea{
        id: area
        anchors.fill: parent

        onPressed: {
            parent.color=  "#88a0a0a0"
        }
        onReleased: {
            area.enabled = false
            waittimer.start()
            image_signal(imageindex)
            parent.color = "#88888888"
        }
    }

}
