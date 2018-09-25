import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import "qrc:/the_JS/Global.js" as JS

Rectangle{

    Timer{
        id: updateTimer
        running: true
        repeat: true
        interval: 3500 //3500毫秒 变换一次
        onTriggered: {
            swipe1.currentIndex =  (swipe1.currentIndex+1)% swipe1.count
        }
    }

    Flickable{
        id: flick
        anchors.fill: parent

        contentWidth: JS.theWidth
        Rectangle{
            anchors.fill: parent
            color: '#cfcfcf'
        }

        Shop_TopLine{
            id: topline
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
        }

        SwipeView{
            id: swipe1
            anchors.top: topline.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            height: JS.dpH(100)

            Page{
                Image{
                    anchors.fill: parent
                    source: 'qrc:/QML_Shop/image/buy.png'
                }
            }
            Page{
                Image{
                    anchors.fill: parent
                    source: 'qrc:/QML_Shop/image/buy.png'
                }
            }
            Page{
                Image{
                    anchors.fill: parent
                    source: 'qrc:/QML_Shop/image/buy.png'
                }
            }
        }
        PageIndicator {
            id: indicator
            interactive: true
            count: swipe1.count
            currentIndex: swipe1.currentIndex

            anchors.bottom: swipe1.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onCurrentIndexChanged: {
              swipe1.currentIndex = indicator.currentIndex
            }

        }
    //        陶瓷 剪纸  编织  茶类
    //        糖人 书法  面塑  伞
        Rectangle{
            anchors.top: swipe1.bottom
            anchors.topMargin: JS.dpH(5)
            anchors.left: parent.left
            anchors.right: parent.right
            height: JS.dpH(180)
            Image {
                anchors.fill: parent
                source: "qrc:/Images/sky.jpeg"
            }

            GridLayout{
                columns: 4

                Type_Button{
                    source: 'qrc:/QML_Shop/image/type/taoci1.png'
                    mytext:'陶瓷'
                    onClicked: console.log('fuck')
                    Layout.leftMargin:column_space
                    Layout.topMargin: row_space
                }
                Type_Button{
                    source: 'qrc:/QML_Shop/image/type/jianzhi2.png'
                    mytext:'剪纸'
                    onClicked: console.log('fuck')
                    Layout.leftMargin:column_space
                    Layout.topMargin: row_space
                }
                Type_Button{
                    source: 'qrc:/QML_Shop/image/type/bianzhi3.png'
                    mytext:'编织'
                    onClicked: console.log('fuck')
                    Layout.leftMargin:column_space
                    Layout.topMargin: row_space
                }
                Type_Button{
                    source: 'qrc:/QML_Shop/image/type/chayi4.png'
                    mytext:'茶艺'
                    onClicked: console.log('fuck')
                    Layout.leftMargin:column_space
                    Layout.topMargin: row_space
                }
                Type_Button{
                    source: 'qrc:/QML_Shop/image/type/tangren5.png'
                    mytext:'糖人'
                    onClicked: console.log('fuck')
                    Layout.leftMargin:column_space
                    Layout.topMargin: row_space
                }
                Type_Button{
                    source: 'qrc:/QML_Shop/image/type/shufa6.png'
                    sourceS: Qt.size(JS.dpW(40),JS.dpH(40))
                    mytext:'书法'
                    onClicked: console.log('fuck')
                    Layout.leftMargin:column_space
                    Layout.topMargin: row_space
                }
                Type_Button{
                    source: 'qrc:/QML_Shop/image/type/miansu7.png'
                    mytext:'面塑'
                    onClicked: console.log('fuck')
                    Layout.leftMargin:column_space
                    Layout.topMargin: row_space
                }
                Type_Button{
                    source: 'qrc:/QML_Shop/image/type/san8.png'
                    sourceS: Qt.size(JS.dpW(40),JS.dpH(40))
                    mytext:'油纸伞'
                    onClicked: console.log('fuck')
                    Layout.leftMargin:column_space
                    Layout.topMargin: row_space
                }

            }
        }

    }
}
