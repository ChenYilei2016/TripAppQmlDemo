import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtMultimedia 5.4
import "qrc:/the_JS/Global.js" as JS

Rectangle {


    width: JS.dpW(360)/3
    height: JS.dpH(210)
    visible: true
    property bool isRunning: false
    property string url:""

    Rectangle {
        color: "black"
        anchors.fill: parent

        Video {
            id: mediaPlayer
            source: url
            autoPlay: false
            autoLoad: false
            volume: 0.30
            anchors.fill: parent

            onPaused: isRunning = false
            onStopped: isRunning =false
        }


        //中间按钮显示
        Rectangle{
            id: showbtn
            color: "transparent"
            anchors.fill: mediaPlayer
            Rectangle{
                id: cenbtn
                anchors.centerIn: showbtn
                width: JS.dpW(38)
                height: JS.dpH(38)
                radius: width/2
                color: "#6fffffff"
                Image {
                    id: play_pause
                    anchors.fill: parent
                    source:{
                        if(isRunning){
                            cenbtn.color = "transparent"
                            return ""
                        }
                        else{
                            cenbtn.color = "#6fffffff"
                            return "qrc:/Images/public/play.png"
                        }
                    }
                }
            }
        }

        MouseArea{
            anchors.fill: parent
            onClicked:{
                if(isRunning){
                    isRunning = false
                    mediaPlayer.pause()

                }
                else{
                    isRunning = true
                    mediaPlayer.play()
                }
            }
        }
    }
    //进度条
    Rectangle {
        id: progressBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 0
        height: JS.dpH(12)
        color: "lightGray"

        Rectangle {
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: mediaPlayer.duration>0?parent.width*mediaPlayer.position/mediaPlayer.duration:0
            color: "darkGreen"
        }

        MouseArea {
            property int pos
            anchors.fill: parent

            onClicked: {
            if (mediaPlayer.seekable)
                pos = mediaPlayer.duration * mouse.x/width
                mediaPlayer.seek(pos)
            }
        }
    }
}

















