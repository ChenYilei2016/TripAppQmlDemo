import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import "qrc:/the_JS/Global.js" as JS
Rectangle{

    Flickable{
        id: flick
        anchors.fill: parent

        width: parent.width
        Rectangle{
            anchors.fill: parent
            color: '#cfcfcf'
        }

        Rectangle{
            id: top
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            color: 'red'
            height: JS.dpH(150)
        }

        Rectangle{
            anchors.top: top.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: 'transparent'
            Text {
                anchors.centerIn: parent
                text: qsTr("暂时没弄")
            }
        }

    }


}
