import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2 as C2
import "qrc:/the_JS/Global.js" as JS
import 'qrc:/the_JS/Fun.js' as FUN

Rectangle{
    anchors.fill: parent
    TopHeader{
        id: topheader
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        isMain: true
        text: theTitle
    }
    ScrollView{
       id: scrollview
       anchors.top:topheader.bottom
       anchors.left: parent.left
       anchors.right: parent.right
       anchors.bottom: parent.bottom
       horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff //水平无滑轮
       verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff //垂直无滑轮显示

       //背景图片
       Image{
           source: "qrc:/Images/sky.jpeg"
           anchors.fill: parent
           asynchronous: true
       }
       GridLayout{
           anchors.fill: parent
           columns: 2
           rowSpacing: 0
           columnSpacing: 0

           //身边 0
           ImageBtn{
               image: "qrc:/Images/MainMenu/nearPlace.png"
               text: "当地传统技艺"
               imageindex: 0
               Layout.leftMargin: column_space
               Layout.topMargin: row_space

               onImage_signal:{
                   if(-1== the_place)
                       netRequest.requestUrl() //没有通过网 就连接
                   else
                       FUN.place_choose(the_place) //有地址 就选择
               }
           }


           // 各地的传统技艺 1
           ImageBtn{
               image: "qrc:/Images/MainMenu/diffPlace.png"
               text: "各地传统技艺"
               imageindex: 1
               Layout.leftMargin: column_space
               Layout.topMargin: row_space

               onImage_signal:{
                   JS.theStackview.push( Qt.createComponent('qrc:/QML_ready/Place_Choose.qml') )
               }
           }

           //小视频观看 2
           ImageBtn{
               image: "qrc:/Images/MainMenu/Movie.png"
               text: "小视频观看"
               imageindex: 2
               Layout.leftMargin: column_space
               Layout.topMargin: row_space

               onImage_signal:{
                   JS.theStackview.push( Qt.createComponent('qrc:/QML_Video/MovieScroll.qml') )
               }
           }

           //平台交流 4
           ImageBtn{
               image: "qrc:/Images/MainMenu/Talk.png"
               text: "平台交流"
               imageindex: 4
               Layout.leftMargin: column_space
               Layout.topMargin: row_space

               onImage_signal:{
                   JS.theStackview.push( Qt.createComponent('qrc:/QML_TalkChat/TalkChat.qml') )
               }
           }

           //6
           ImageBtn{
               image: "qrc:/Images/MainMenu/YuYue.png"
               text: "报名学习"
               imageindex: 6
               Layout.leftMargin: column_space
               Layout.topMargin: row_space

               onImage_signal:{
                   JS.theStackview.push( Qt.createComponent('qrc:/QML_order/Order.qml') )
               }
           }
           //最近新闻 5
           ImageBtn{
               image: "qrc:/Images/MainMenu/NewS.png"
               text: "新闻动态"
               imageindex: 5
               Layout.leftMargin: column_space
               Layout.topMargin: row_space

               onImage_signal:{
                   JS.theStackview.push( Qt.createComponent('qrc:/QML_News/News.qml') )
               }
           }

            //帮助信息 3
           ImageBtn{
               image:"qrc:/Images/MainMenu/AppBuy.png"
               text: '技艺商城'
               imageindex: 3
               Layout.leftMargin: column_space
               Layout.topMargin: row_space

               onImage_signal:{
                   JS.theStackview.push( Qt.createComponent('qrc:/QML_Shop/ShopMain.qml') )
               }

           }


           //7
           ImageBtn{
               image: "qrc:/Images/MainMenu/contentus.png"
               text: "联系我们"
               imageindex: 7
               Layout.leftMargin: column_space
               Layout.topMargin: row_space

               onImage_signal:{
                   JS.theStackview.push( Qt.createComponent('qrc:/QML_ready/ContentUs.qml') )
               }
           }
       }

   }

}
