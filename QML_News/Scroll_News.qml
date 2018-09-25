import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import "qrc:/the_JS/Global.js" as JS

import 'qrc:/QML_scroll'
import NET_news 1.0

Rectangle{
    visible: true
    id: window

    property var titlelist:['12']
    property var urllist :['www.baidu.com']

    property int model_sum : urllist.length
    property string theTitle:'新闻动态'


    //点击按钮 产生btnsignal 然后动态创建一个资料网页

    ScrollView {
        anchors.fill: parent
        id: scrollview
        property alias list: listview

        verticalScrollBarPolicy:Qt.ScrollBarAlwaysOff
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff

        ListView {
            id: listview
            width: parent.width
            spacing: JS.dpH(10)
            model: model_sum
            delegate: Component{
                List_btn{
                    btnindex: index
                    text:qsTr('%1. ').arg(index+1)+titlelist[index]
                    onBtnSignal:{ //先得到首页的 5,6条 的url 和标题     //然后具体图片 和 内容
                        var item = JS.theStackview.push( Qt.createComponent("qrc:/QML_News/News_detail.qml") )
                        //进行 新页面的操作
                        item.mainUrl  = urllist[index]
                        item.detail_request() //请求网络新闻
                    }
                }
            }

        }

    }



}




