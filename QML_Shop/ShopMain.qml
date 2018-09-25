import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import "qrc:/the_JS/Global.js" as JS


Rectangle{
    width: 360
    height:640

    Loader{
        id: loader
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom:shopbottom.top

        source:'qrc:/QML_Shop/ShopHead.qml'
    }

    BottomLine{
        id: shopbottom
        theLoader: loader
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        btn1_checked: true
    }


}
