import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import "qrc:/the_JS/Global.js" as JS


Button{
    width: JS.dpW(50)
    height: JS.dpH(50)

    id: self
    checkable: true

    property alias source :image.source
    property alias sourceS: image.sourceSize
    property alias mytext : text.text

    signal checked_signal()

    onCheckedChanged: {
        if(checked){
            backrect.color = '#88888888'
            checked_signal()
        }
        else{
            backrect.color = 'white'
        }
    }

    background: backrect

    Rectangle{
        id: backrect
        color: 'white'
        implicitHeight: JS.dpH(50)
        implicitWidth: JS.dpW(50)
        Image{
            id: image
            width: JS.dpW(32)
            height:JS.dpH(32)
            source: 'Images/TopHeader/maintop.png'
            sourceSize: Qt.size(JS.dpW(32),JS.dpH(32))
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
        }
        Text{
            id: text
            text: '首页'
            font.bold: true
            anchors.top: image.bottom
            anchors.topMargin: JS.dpH(2)
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}
