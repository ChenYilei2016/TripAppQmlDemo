import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

import "qrc:/the_JS/Global.js" as JS
import 'qrc:/QML_ready'
import NET_news 1.0

Rectangle{
    visible: true
    id: self

    property string theTitle:'新闻动态'
    //查询新闻列表 的网络类
    R_net_news{
        id: r_net_news
        outTime: 1850
        theChoose: 1
        onMainSuccessTitleUrl:{
            //QStringList m_1,QStringList m_2
            scroll_news.titlelist=  m_1
            scroll_news.urllist  =  m_2
            scroll_news.visible = true
            net_btn.enabled = false
        }
        onMainError:{
            saytext.visible = true
            net_btn.enabled = true
        }
        Component.onDestruction:{
            r_net_news.quit()
            r_net_news.theWait()
        }
    }


    TopHeader{
        id: topheader
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        text: theTitle
        isMain: false 
    }
    Rectangle{
        id: temprect
        anchors.top:topheader.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        Image{
            anchors.fill: parent
            source:'qrc:/Images/sky.jpeg'
            asynchronous: true
        }

        Button{
            id: net_btn
            text: '获得最近新闻列表'
            onClicked: {
                net_btn.enabled = false// 另一个线程执行
                r_net_news.start()
            }
            anchors.centerIn: parent

        }

        //提示 显示框
        Text{
            id: saytext
            text:'网络连接错误,请重试.'
            visible: false
            font.bold: true
            anchors.top: net_btn.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Scroll_News{
            id: scroll_news
            anchors.fill: parent
            visible: false
            urllist: ['网络错误']
            titlelist: ['404']
            z: 100
        }
    }

}
