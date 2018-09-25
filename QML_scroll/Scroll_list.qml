import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3

import 'qrc:/QML_ready'
import "qrc:/the_JS/Global.js" as JS

Rectangle{
    visible: true
    id: window

    property var textlist:['发生未知错误']
    property var urllist:['http://www.baidu.com']
    property int model_sum: textlist.length //产生的列表数
    property string theTitle

    //点击按钮 产生btnsignal 然后动态创建一个资料网页
    TopHeader{
        id: topheader
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        text: theTitle
        isMain: false
    }

    ScrollView {
        id: scrollview

        anchors.top:topheader.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        property alias list: listview

        verticalScrollBarPolicy:Qt.ScrollBarAlwaysOff
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff

        ListView {
            id: listview
            anchors.fill: parent
            spacing: JS.dpH(10)
            model: model_sum
            delegate:
                List_btn{
                    btnindex: index
                    text:qsTr('%1. ').arg(index+1)+textlist[index]
                    onBtnSignal:{
                        var item = JS.theStackview.push( Qt.createComponent("qrc:/QML_scroll/Detail_place.qml") )
                        //进行 新页面的操作
                        item.mainurl  = urllist[index]
                        item.theTitle = theTitle
                        item.netLink()
                    }
                }

        }


    }



}




