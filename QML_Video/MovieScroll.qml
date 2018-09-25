import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtMultimedia 5.9

import 'qrc:/QML_ready'
import "qrc:/the_JS/Global.js" as JS

Rectangle{
     visible: true
     property string theTitle:'非物质文化遗产-小视频观赏'

     TopHeader{
         id: topheader
         anchors.top: parent.top
         anchors.left: parent.left
         anchors.right: parent.right
         text: theTitle
         isMain: false
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

        }

         GridLayout{
            columns: 2
            rowSpacing: JS.dpH(1)
            columnSpacing: JS.dpW(1)

            VPlayer{
                id: vp1
                Layout.leftMargin: JS.dpW(15)
                Layout.topMargin: JS.dpH(15)
                url: "qrc:/QML_Video/Video/1.mp4"
            }
            Rectangle{
                width: JS.dpW(190)
                height:vp1.height
                Layout.leftMargin: JS.dpW(15)
                Layout.topMargin: JS.dpH(15)
                color: "transparent"
                Text {
                    text: qsTr("    蜀绣-- 彭世平大师-蜀绣又名“川绣”，是在丝绸或其他织物上采用蚕丝线绣出花纹图案的中国传统工艺，主要指以四川成都为中心的川西平原一带的刺绣,是中国刺绣传承时间最长的绣种之一。")
                    anchors.centerIn: parent
                    width: JS.dpW(200)
                    height: vp1.height
                    wrapMode: Text.Wrap
                    font.bold: true
                    font.pixelSize: JS.dpX(18)
                }
            }

            VPlayer{
                Layout.leftMargin: JS.dpW(15)
                Layout.topMargin: JS.dpH(18)
                url: "qrc:/QML_Video/Video/2.mp4"
            }
            Rectangle{
                width: JS.dpW(190)
                height:vp1.height
                Layout.leftMargin: JS.dpW(15)
                Layout.topMargin: JS.dpH(18)
                color: "transparent"
                Text {
                    text: qsTr("    自贡扎染--工艺非物质文化遗产传承人李娟老师-四川的自贡扎染是古称蜀颉的扎染艺术。自贡扎染工艺性强，以针代笔，无一雷同,色彩斑斓，款式多样，扎痕耐久。图案设计富于情趣，特色浓郁。")
                    anchors.centerIn: parent
                    width: JS.dpW(200)
                    height: vp1.height
                    wrapMode: Text.Wrap
                    font.bold: true
                    font.pixelSize: JS.dpX(18)
                }
            }

            VPlayer{
                Layout.leftMargin: JS.dpW(15)
                Layout.topMargin: JS.dpH(18)
                url: "qrc:/QML_Video/Video/3.mp4"
            }
            Rectangle{
                width: JS.dpW(190)
                height:vp1.height
                Layout.leftMargin: JS.dpW(15)
                Layout.topMargin: JS.dpH(18)
                color: "transparent"
                Text {
                    text: qsTr("    藏绣--藏族编织工艺传承人代益琼老师-藏族善于刺绣、纺织，精巧的工艺为其服饰增添了无穷的魅力。其刺绣，工艺精湛，针法不受经纬限制，适宜绣花草纹样,具有方折的力度感。")
                    anchors.centerIn: parent
                    width: JS.dpW(200)
                    height: vp1.height
                    wrapMode: Text.Wrap
                    font.bold: true
                    font.pixelSize: JS.dpX(18)
                }
            }

            VPlayer{
                Layout.leftMargin: JS.dpW(15)
                Layout.topMargin: JS.dpH(18)
                url: "qrc:/QML_Video/Video/4.mp4"
            }
            Rectangle{
                width: JS.dpW(190)
                height:vp1.height
                Layout.leftMargin: JS.dpW(15)
                Layout.topMargin: JS.dpH(18)
                color: "transparent"
                Text {
                    text: qsTr("    皮影戏--是民间一种以兽皮或纸板做成的人物剪影以表演故事的民间戏剧。表演时，艺人们在白色幕布后面，一边操纵影人，一边用当地流行的曲调讲述故事，同时配以打击乐器和弦乐，有浓厚的乡土气息.")
                    anchors.centerIn: parent
                    width: JS.dpW(200)
                    height: vp1.height
                    wrapMode: Text.Wrap
                    font.bold: true
                    font.pixelSize: JS.dpX(18)
                }
            }

            VPlayer{
                Layout.leftMargin: JS.dpW(15)
                Layout.topMargin: JS.dpH(18)
                url: "qrc:/QML_Video/Video/5.mp4"
            }
            Rectangle{
                width: JS.dpW(190)
                height:vp1.height
                Layout.leftMargin: JS.dpW(15)
                Layout.topMargin: JS.dpH(18)
                color: "transparent"
                Text {
                    text: qsTr("    榫卯--是藏在木头里的灵魂，一种惊艳中国千年的美。是古代中国建筑、家具及其它器械的主要结构方式，是在两个构件上采用凹凸部位相结合的一种连接方式。凸出部分叫榫；凹进部分叫卯.")
                    anchors.centerIn: parent
                    width: JS.dpW(200)
                    height: vp1.height
                    wrapMode: Text.Wrap
                    font.bold: true
                    font.pixelSize: JS.dpX(18)
                }
            }

            VPlayer{
                Layout.leftMargin: JS.dpW(15)
                Layout.topMargin: JS.dpH(18)
                url: "qrc:/QML_Video/Video/6.mp4"
            }
            Rectangle{
                width: JS.dpW(190)
                height:vp1.height
                Layout.leftMargin: JS.dpW(15)
                Layout.topMargin: JS.dpH(18)
                color: "transparent"
                Text {
                    text: qsTr("    鲁班凳--物如其名，为鲁班所发明的哦，又名“瞎掰”是一个翻手为座、覆手为枕的木制生活用品。其制作工艺非常考究，需要有一定的手活。需要有一定的基础工。")
                    anchors.centerIn: parent
                    width: JS.dpW(200)
                    height: vp1.height
                    wrapMode: Text.Wrap
                    font.bold: true
                    font.pixelSize: JS.dpX(18)
                }
            }




        }

    }



}

