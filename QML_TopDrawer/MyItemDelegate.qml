import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2 as C2

import "qrc:/the_JS/Global.js" as JS

C2.ItemDelegate{
    width: drawer.width
    height: JS.dpH(48)

    property alias source: image_shouye.source
    property alias showtext : thetext.text

    Rectangle{
        id: back_shouye
        anchors.fill: parent
        color: 'transparent'
    }
    Image{
        id: image_shouye
        width: JS.dpW(30)
        height: JS.dpH(30)
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: JS.dpW(10)
        source: 'qrc:/Images/TopHeader/maintop.png'
        sourceSize: Qt.size(JS.dpW(30),JS.dpH(30))
        asynchronous: true
    }
    Text{
        id: thetext
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: image_shouye.right
        anchors.leftMargin: JS.dpW(11)
        text:'首页'
        font.pixelSize: JS.dpX(16)
        font.bold: true
        color:'#AFB1C0'
    }
    Rectangle{
        height: JS.dpH(1)
        width: parent.width
        color: '#7f8a8a8a'
        anchors.bottom: parent.bottom
    }
}
