import QtQuick 2.9
import QtQuick.Window 2.3
import "qrc:/the_JS/Global.js" as JS

//开头动画

Rectangle {

    //隐藏界面
    id: self
    signal hide
    anchors.fill: parent
    color: "black"

    Timer {
        interval: 50//2550

        running: true

        onTriggered:{
            hide()
        }
    }

    Image {
        id: imgLogo

        source: "qrc:/Images/SplashAnimation.png"

        anchors.fill: parent
    }

}
