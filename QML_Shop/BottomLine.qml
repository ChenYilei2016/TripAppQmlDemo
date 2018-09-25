import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import "qrc:/the_JS/Global.js" as JS


Rectangle{
    width: JS.dpW(360)
    height: JS.dpH(60)
    id: self

    property real row_space: (JS.theWidth- 3* JS.dpW(50) )/4
    property alias btn1_checked: btn1.checked
    property alias btn2_checked: btn2.checked
    property alias btn3_checked: btn3.checked
    property var theLoader

    color: 'white'
    Rectangle{
        width: parent.width
        height: JS.dpH(1)
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        color: '#E0E0E0'
    }

    //互斥组
    ButtonGroup{
        id: btngroup
    }

    RowLayout{
        anchors.verticalCenter: parent.verticalCenter
        Bottom_Btn{
            id:btn1
            source:'qrc:/Images/TopHeader/maintop.png'
            Layout.leftMargin: row_space
            ButtonGroup.group: btngroup
            onChecked_signal: {
                theLoader.source = 'qrc:/QML_Shop/ShopHead.qml'
            }
        }
        Bottom_Btn{
            id: btn2
            mytext:'购单'
            source: 'qrc:/QML_Shop/image/buy.png'
            Layout.leftMargin: row_space
            ButtonGroup.group: btngroup
            onChecked_signal: {
                theLoader.source = 'qrc:/QML_Shop/ShopBuylist.qml'
            }
        }
        Bottom_Btn{
            id: btn3
            mytext: '我的'
            source: 'qrc:/QML_Shop/image/my.png'
            Layout.leftMargin: row_space
            ButtonGroup.group: btngroup
            onChecked_signal: {
                theLoader.source = 'qrc:/QML_Shop/ShopMyself.qml'
            }
        }
    }


}
