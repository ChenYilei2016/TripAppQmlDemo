import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import 'qrc:/QML_ready'
import "qrc:/the_JS/Global.js" as JS

Rectangle{
    id: self
    property string theTitle :'帮助信息'

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

        Rectangle{
            anchors.fill: parent
            color:'#EDE5D7'
        }
        Flickable
        {
            id: flick
            anchors.fill: parent
            focus: true

            //可拖拽内容大小
            contentHeight: col.height
            //隐藏大于显示窗口的部分
            clip: true;
            Column{
                id: col
                spacing: JS.dpH(0)

                Help_child{
                    titletext: '当地传统技艺'
                    maintext:'   根据用户手机当前的位置,请求网络得到所在省份,向用户推荐当前省份有的技艺(需要联网).'
                    tsource: 'qrc:/Images/MainMenu/nearPlace.png'
                }
                Help_child{
                    titletext: '各地传统技艺'
                    maintext:'   列出了不同的省份,可以让用户选择查看不同省份所具有的传统技艺(需要联网).'
                    tsource: 'qrc:/Images/MainMenu/diffPlace.png'
                }
                Help_child{
                    titletext: '报名学习'
                    maintext:'   可以报名参加传承者的活动之中,亲身经历得到更多的体验.'
                    tsource: 'qrc:/Images/MainMenu/YuYue.png'
                }
                Help_child{
                    titletext: '小视频观赏'
                    maintext:'   介绍了一些传统技艺,并且附有视频可以观看.'
                    tsource: 'qrc:/Images/MainMenu/Movie.png'
                }
                Help_child{
                    titletext: '平台交流'
                    maintext:'   提供了一个交流平台,可以随意让传承者和感兴趣的用户随意的聊天(后续和登陆一起实现).'
                    tsource: 'qrc:/Images/MainMenu/Talk.png'
                }
                Help_child{
                    titletext: '新闻动态'
                    maintext:'   可以浏览近期网上关于非物质文化遗产的相关动态新闻文本,和相关图片(需要联网).'
                    tsource: 'qrc:/Images/MainMenu/NewS.png'
                }
                Help_child{
                    titletext: '技艺商城'
                    maintext:'   可以购买或者上架相关传统技艺的商品.'
                    tsource: 'qrc:/Images/MainMenu/AppBuy.png'
                }
                Help_child{
                    titletext: '联系我们'
                    maintext:'   提供了联系我们的方式.'
                    tsource: 'qrc:/Images/MainMenu/contentus.png'
                }


            }

        }
    }
}
