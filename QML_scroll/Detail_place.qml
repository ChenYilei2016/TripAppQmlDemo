import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls 2.2 as C2
import QtQuick.Controls.Styles 1.4

import "qrc:/the_JS/Global.js" as JS
import 'qrc:/QML_ready'
import NetREQUEST 1.0

Rectangle{
    id: self

    property string mainurl
    property string theTitle
    property string maintext:'正在连接网络中......'

    function netLink(){
        r_netrequest.outtime = 1850 //另一个线程执行
        r_netrequest.url = mainurl
        r_netrequest.start()
    }

    //背景图片
    Image{
        anchors.fill: parent
        source: "qrc:/Images/sky.jpeg"
        asynchronous: true
    }

    R_net_detail_request{
        id: r_netrequest
        onResponseSuccessful:{
            maintext = str
        }
        onResponseFaild:{
            maintext = '网络连接失败!'
        }
        Component.onDestruction: {
            r_netrequest.quit()
            r_netrequest.theWait()
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

    Flickable
    {
        id: flick
        anchors.top:topheader.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        focus: true
        width: parent.width
        height: 700
        //可拖拽内容大小
        //contentWidth: textlabel.width
        contentHeight: textlabel.height
        //隐藏大于显示窗口的部分
        clip: true;
        Text{
            id:textlabel
            width: self.width
            text: maintext
            textFormat: Text.RichText
            wrapMode: Text.Wrap
            font.bold: true
            font.pixelSize: JS.dpX(16)

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
