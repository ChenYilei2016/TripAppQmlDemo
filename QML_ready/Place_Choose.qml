import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import "qrc:/the_JS/Global.js" as JS
import 'qrc:/the_JS/Fun.js' as FUN

Rectangle{
    id: self
    property int column_space: (JS.theWidth-JS.dpW(300))/3
    signal mimage_signal(int scrollimageindex)
    property string theTitle:'非物质文化遗产-各地传统技艺'

    //对不同的地区选择 push不同的页面
    Connections{
        target: self
        onMimage_signal:{
            FUN.place_choose(scrollimageindex)//scrollimageindex 地区选择
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
                rowSpacing: 0//column_space
                columnSpacing: 0//column_space

                //从1 开始计数

                ImageBtn{
                    image: "qrc:/Images/Place_choose/1.png"
                    text: "安徽省"
                    imageindex: 1
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space

                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/2.png"
                    text: "北京省"
                    imageindex: 2
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/3.png"
                    text: "福建省"
                    imageindex: 3
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/4.png"
                    text: "甘肃省"
                    imageindex: 4
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/5.png"
                    text: "广东省"
                    imageindex: 5
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/6.png"
                    text: "广西壮族自治区"
                    imageindex: 6
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/7.png"
                    text: "贵州省"
                    imageindex: 7
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/8.png"
                    text: "海南省"
                    imageindex: 8
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/9.png"
                    text: "河北省"
                    imageindex: 9
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/10.png"
                    text: "黑龙江省"
                    imageindex: 10
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/11.png"
                    text: "湖南省"
                    imageindex: 11
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/12.png"
                    text: "江西省"
                    imageindex: 12
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/13.png"
                    text: "江苏省"
                    imageindex: 13
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/14.png"
                    text: "内蒙古自治区"
                    imageindex: 14
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/15.png"
                    text: "青海省"
                    imageindex: 15
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/16.png"
                    text: "陕西省"
                    imageindex: 16
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/17.png"
                    text: "山西省"
                    imageindex: 17
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/18.png"
                    text: "上海省"
                    imageindex: 18
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/19.png"
                    text: "四川省"
                    imageindex: 19
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/20.png"
                    text: "西藏自治区"
                    imageindex: 20
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/21.png"
                    text: "新疆维吾尔自治区"
                    imageindex: 21
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/22.png"
                    text: "云南省"
                    imageindex: 22
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }
                ImageBtn{
                    image: "qrc:/Images/Place_choose/23.png"
                    text: "浙江省"
                    imageindex: 23
                    Layout.leftMargin: column_space
                    Layout.topMargin: column_space
                    onImage_signal:mimage_signal(imageindex)
                }


            }


    }



}
