import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import "qrc:/the_JS/Global.js" as JS


Rectangle{

    width: JS.theWidth
    height:JS.dpH(45)
    color: 'transparent'

    TextField{
        width: parent.width
        height: JS.dpH(30)
        placeholderText: '搜索商品,店铺.'
        anchors.centerIn: parent
        background: Rectangle{
            implicitWidth: JS.theWidth
            implicitHeight: JS.dpH(45)
            radius: height/2
            Image {
                source: "qrc:/QML_Shop/image/find.png"
                sourceSize: Qt.size(JS.dpW(25),JS.dpH(25))
                anchors.right: parent.right
                anchors.rightMargin: JS.dpW(5)
            }
        }
    }

}
