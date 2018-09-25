import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import "qrc:/the_JS/Global.js" as JS


Button{
    width: JS.dpW(75)
    height: JS.dpH(75)

    id: self
    property real row_space: (JS.dpH(180)-JS.dpH(75)*2 )/3
    property real column_space:(JS.theWidth-JS.dpW(75) *4 )/6

    property alias source : image.source
    property alias sourceS : image.sourceSize
    property alias mytext : text.text

    background: backrect

    Rectangle{
        id: backrect
        color: 'transparent'
        implicitHeight: JS.dpH(75)
        implicitWidth: JS.dpW(75)

        Rectangle{
            id: imagerect
            width: JS.dpW(51)
            height: JS.dpH(51)
            radius: height/2
            border.color: '#8fa8a8a8'
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: image
                source: "taoci.png"
                sourceSize: Qt.size(JS.dpW(50),JS.dpH(50))
                anchors.horizontalCenter: parent.horizontalCenter
            }
            clip: true
        }

        Text{
            text: '陶瓷'
            id: text
            font.bold: true
            font.pixelSize: JS.dpX(16)
            anchors.top: imagerect.bottom
            anchors.topMargin: JS.dpH(5)
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
