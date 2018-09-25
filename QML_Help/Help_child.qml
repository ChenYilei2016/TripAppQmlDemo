import QtQuick 2.0

import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import "qrc:/the_JS/Global.js" as JS

Rectangle {
    id: self
    width: JS.theWidth
    height: JS.dpH(130)
    color: 'transparent'

    property string tsource:'qrc:/images/HelpLogo.png'
    property string titletext:'身边的传统技艺'
    property string maintext:'   根据用户手机当前的位置,请求网络得到所在省份,向用户推荐当前省份有的技艺.'

    //标题字
    Text{
        x: JS.dpW(7)
        y: JS.dpH(12)
        text:titletext
        font.bold: true
        font.pixelSize: JS.dpX(19)
    }

    Image{
        id: image
        source: tsource
        sourceSize: Qt.size(JS.dpW(75),JS.dpH(70))
        x: JS.dpW(9)
        y: JS.dpH(38)
        width: JS.dpW(75)
        height: JS.dpH(70)
        asynchronous: true
    }

    //显示字
    Rectangle{
        width: JS.dpW(240)
        height: JS.dpH(70)
        x: JS.dpW(105)
        y: JS.dpH(43)
        color: 'transparent'
        Text{
            anchors.fill: parent
            font.bold: true
            wrapMode: Text.Wrap
            font.pixelSize: JS.dpX(16)
            text:maintext
        }
    }


    Rectangle{
        width: JS.theWidth-JS.dpW(15)
        height: JS.dpH(1)
        color: '#8fa8a8a8'
        anchors.top: image.bottom
        anchors.topMargin: JS.dpH(8)
        anchors.horizontalCenter: parent.horizontalCenter
    }




}
