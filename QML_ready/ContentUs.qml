import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import "qrc:/the_JS/Global.js" as JS

Rectangle{

    id: self
    property string theTitle: '联系我们'


    TopHeader{
        id: topheader
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        text: theTitle
        isMain: false
    }
    Rectangle{
        id: tempRect
        anchors.top:topheader.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        Image{
            anchors.fill: parent
            source: 'qrc:/Images/sky.jpeg'
            asynchronous: true
        }

        Rectangle{
            id: big_image
            anchors.horizontalCenter: parent.horizontalCenter //水平
            anchors.top: parent.top
            anchors.topMargin: JS.dpH(25)
            width: JS.dpW(170)
            height: JS.dpH(170)
            color: 'transparent'
            Image {
                anchors.fill: parent
                source: "qrc:/Images/public/ZhaoHuaXiShi.png"
                asynchronous: true
            }
        }
        Text {
            id: app_name
            text: qsTr("朝花夕拾")
            font.family: '华文新魏'
            font.bold: true
            font.pixelSize: JS.dpX(20)
            anchors.top: big_image.bottom
            anchors.topMargin: JS.dpH(10)
            anchors.horizontalCenter: big_image.horizontalCenter
        }
        Text {
            id: app_version
            text: qsTr("版本: v1.0.0")
            font.family: '宋体'
            font.bold: true
            font.pixelSize: JS.dpX(18)
            anchors.top: app_name.bottom
            anchors.topMargin: JS.dpH(5)
            anchors.horizontalCenter: big_image.horizontalCenter
        }

        Rectangle{
            id: connect_QQ
            height: JS.dpH(25)
            color: 'transparent'
            anchors.left: big_image.left
            anchors.right: big_image.right
            anchors.top: app_version.bottom
            anchors.topMargin: JS.dpH(50)
            Row{
                anchors.fill: parent
                spacing: JS.dpW(5)
                Image{
                    source:'qrc:/Images/public/Conetent_QQ.png'
                    asynchronous: true
                    sourceSize: Qt.size(JS.dpW(23),JS.dpH(23))
                }
                Text{
                    text: "0123456789 XX先生"
                    font.bold: true
                    font.pixelSize: JS.dpX(18)
                    verticalAlignment: Text.AlignBottom

                }
            }

        }
        Rectangle{
            id: connect_email
            color: 'transparent'
            height: JS.dpH(25)
            anchors.left: big_image.left
            anchors.right: big_image.right
            anchors.top: connect_QQ.bottom
            anchors.topMargin: JS.dpH(5)
            Row{
                anchors.fill: parent
                spacing: JS.dpW(5)
                Image{
                    source:'qrc:/Images/public/Content_mail.png'
                    asynchronous: true
                    sourceSize: Qt.size(JS.dpW(23),JS.dpH(23))
                }
                Text{
                    text: "XXX_0123456789@163.com"
                    font.bold: true
                    font.pixelSize: JS.dpX(18)
                    verticalAlignment: Text.AlignBottom

                }
            }

        }
        Rectangle{
            id: connect_qun
            color: 'transparent'
            height: JS.dpH(25)
            anchors.left: big_image.left
            anchors.right: big_image.right
            anchors.top: connect_email.bottom
            anchors.topMargin: JS.dpH(5)
            Row{
                anchors.fill: parent
                spacing: JS.dpW(5)
                Image{
                    source:'qrc:/Images/public/Content_qun.png'
                    asynchronous: true
                    sourceSize: Qt.size(JS.dpW(23),JS.dpH(23))
                }
                Text{
                    text: "交流QQ群:0123456789"
                    font.bold: true
                    font.pixelSize: JS.dpX(18)
                    verticalAlignment: Text.AlignBottom

                }
            }

        }
        Rectangle{
            id: connect_weibo
            color: 'transparent'
            height: JS.dpH(25)
            anchors.left: big_image.left
            anchors.right: big_image.right
            anchors.top: connect_qun.bottom
            anchors.topMargin: JS.dpH(5)
            Row{
                anchors.fill: parent
                spacing: JS.dpW(5)
                Image{
                    source:'qrc:/Images/public/Content_Weibo.png'
                    sourceSize: Qt.size(JS.dpW(23),JS.dpH(23))
                    asynchronous: true
                }
                Text{
                    text: "新浪微博搜索:XXXXXX"
                    font.bold: true
                    font.pixelSize: JS.dpX(18)
                    verticalAlignment: Text.AlignBottom

                }
            }
        }
        Rectangle{
            id: connect_weixin
            color: 'transparent'
            height: JS.dpH(25)
            anchors.left: big_image.left
            anchors.right: big_image.right
            anchors.top: connect_weibo.bottom
            anchors.topMargin: JS.dpH(5)
            Row{
                anchors.fill: parent
                spacing: JS.dpW(5)
                Image{
                    source:'qrc:/Images/public/Content_weixin.png'
                    asynchronous: true
                    sourceSize: Qt.size(JS.dpW(23),JS.dpH(23))
                }
                Text{
                    text: "微信公众号搜索:XXXX"
                    font.bold: true
                    font.pixelSize: JS.dpX(18)
                    verticalAlignment: Text.AlignBottom

                }
            }
        }

        Text {
            id: shengming
            text: qsTr("声明:部分内容来源网络,如有侵权,请联系我们!")
            anchors.left: big_image.left
            anchors.right: big_image.right
            anchors.top: connect_weixin.bottom
            anchors.topMargin: JS.dpH(25)
            font.pixelSize: JS.dpX(10)
            font.bold: true
        }
    }
}
