import QtQuick 2.7
import QtQuick.Layouts 1.2
import QtQuick.Window 2.3
import QtQuick.Controls 1.4 as C1
import QtQuick.Controls 2.2 as C2
import QtQuick.Controls.Styles 1.4

import "qrc:/the_JS/Global.js" as JS
import 'qrc:/QML_ready'
import NET_news 1.0

//显示新闻的detail网页


Rectangle {
    visible: true
    id: self
    property string mainUrl

    property var detailText:'正在连接网络中......'
    property var imageList:[]
    property string theTitle:'新闻动态'



    //进行网络 查询新闻
    function detail_request(){
        r_net_news.detail_Url = mainUrl //另一个线程执行
        r_net_news.start()
    }

    //获取主要内容 网络类
    R_net_news{
       id: r_net_news
       outTime: 1850
       theChoose: 2
       onDetailSuccessTextImage:{
           detailText = m_1
           imageList = m_2
       }
       onDetailError:{
           detailText = '连接网络失败!'
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
            source: 'qrc:/Images/sky.jpeg'
            anchors.fill: parent
            asynchronous: true
        }


        Flickable{
            id: flick
            anchors.fill: parent
            contentHeight: showtext.height + swipeview.height +JS.dpH(35)


            C2.SwipeView{
                id: swipeview
                interactive: true //响应手指
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: JS.dpW(3)
                anchors.rightMargin: JS.dpW(3)
                z: -1

                height:{
                    if(imageList.length === 0)
                        return 0
                    else
                        return JS.dpH(200)
                }

                Repeater{
                    model: imageList.length
                    C2.Page{
                        title: 'test'+index
                        Image{
                            source: imageList[index]
                            width: self.width-JS.dpW(5)
                            height: JS.dpH(200)
                            opacity: 0.8
                        }
                    }
                }

            }

            C2.PageIndicator {
                  id: indicator
                  interactive: true
                  count: swipeview.count
                  currentIndex: swipeview.currentIndex

                  anchors.top: swipeview.bottom
                  anchors.bottomMargin: JS.dpH(5)
                  anchors.horizontalCenter: parent.horizontalCenter
                  onCurrentIndexChanged: {
                    swipeview.currentIndex = indicator.currentIndex
                  }
            }

            //显示内容的text
            Text{
                id: showtext
                anchors.top:  indicator.bottom
                anchors.topMargin: JS.dpH(2)
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: JS.dpW(3)
                anchors.rightMargin: JS.dpW(3)

                text:detailText
                textFormat: Text.RichText
                wrapMode: Text.Wrap
                onLinkActivated: Qt.openUrlExternally(link)
            }

        }
                //竖滚动条
            Rectangle
            {
                id: scrollbar_vertical
                visible: opacity>0
                radius: JS.dpX(2)
                opacity: 1.0
                Behavior on opacity{ NumberAnimation {duration: 500} }
                anchors.right: flick.right
                //当前可视区域的位置.为百分比值,0-1之间
                y: flick.visibleArea.heightRatio>=1?0:flick.visibleArea.yPosition * flick.height
                width: 7
                //当前可视区域的高度比例,为百分比值,0-1之间
                height: flick.visibleArea.heightRatio<1?flick.visibleArea.heightRatio * flick.height:0
                color: "#8fa8a8a8"

            }
    }

}
