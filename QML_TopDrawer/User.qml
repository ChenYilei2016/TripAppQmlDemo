import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2 as C2

import "qrc:/the_JS/Global.js" as JS

//qrc:/QML_TalkChat/images/head1.png

Rectangle{
    color: 'transparent'
    Image{
        id: userImage
        source:'qrc:/QML_TalkChat/images/head1.png'
        sourceSize: Qt.size(JS.dpW(82),JS.dpH(82) )
        anchors.verticalCenter: parent.verticalCenter
        x: 0.1 * parent.width
    }
    Rectangle{
        id: imageborder
        color: 'transparent'
        border.width: JS.dpX(1)
        border.color: '#333544'
        anchors.fill: userImage
        radius: userImage.width / 2
    }
    Text{
        id: userName
        text: '未登陆'
        font.bold: true
        color: '#AFB1C0'
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: imageborder.right
        anchors.leftMargin: JS.dpW(10)
        font.pixelSize: JS.dpX(20)
    }

    Rectangle{
        height: JS.dpH(1)
        width: parent.width
        color: '#7f8a8a8a'
        anchors.bottom: parent.bottom
    }

}
