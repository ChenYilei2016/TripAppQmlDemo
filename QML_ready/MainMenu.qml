import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2 as C2
import "qrc:/the_JS/Global.js" as JS
import 'qrc:/the_JS/Fun.js' as FUN

Rectangle {
    id: self

    property int column_space: (JS.theWidth-JS.dpW(300))/3
    property int row_space : (JS.theHeight-JS.dpH(60) -JS.dpH(500))/6
    property alias depth : stackview.depth
    property alias stackview : stackview
    property string theTitle: '非物质文化遗产-传统技艺观赏'

    //标记back是否被按下（如果true再次接受到按下消息后将退出app）
    property bool backPressed: false;
    //消息的显示
    property string messagex_text
    property int the_place:-1 //储存当地省份

    //检测地理位置
    Connections{
        target: netRequest
        onNetsuccess:{
            FUN.place_netsuccess()
        }
        onNeterror:{
            console.debug('net error')
            messagex_text = '请检查网络是否正常!'
            back_animation.start()
        }
    }

    //主菜单选择栏
    StackView{
         id: stackview
         anchors.fill: parent

         initialItem:MainSwipe{

         }

         Component.onCompleted: {
            JS.theStackview = stackview
         }
    }
    Connections{
        target: stackview.currentItem
        ignoreUnknownSignals: true
        onLoginOk:{
            FUN.toMain()
        }
    }

      //检测返回键↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    //链接过滤器信号
    Connections{
        target:keyFilter;
        onSig_KeyBackPress:{
            //如果stackview不是在根节点就pop不标记接受到back信号
            if (stackview.depth > 1)
            {
                stackview.pop();
                if(stackview.depth == 1)
                {

                }
                else{ //动态改变顶部名字

                }
            }
            //第一次接受到back
            else if(!backPressed)
            {
                //启动一个定时器，在定时器结束后没收再次收到back信号就将back标记初始化
                timer.start();
                backPressed = true;
                //启动提示动画
                messagex_text= '再按一次退出'
                back_animation.start();
            }
            //在 一定时间没连续收到back信号
            else if(backPressed)
            {
                Qt.quit();
            }
        }
    }
    //定时器
    Timer{
        id:timer;
        interval: 3000;
        triggeredOnStart: false;
        onTriggered: {
               backPressed = false;
               timer.stop();
        }
    }
        //退出提示的动画
    Rectangle{
        id:exit_rect;
        radius: JS.dpX(20);
        z: 10;
        width: JS.dpW(150);
        height: JS.dpH(30);
        color:"black";
        opacity:0;
        anchors.centerIn: parent;
        Text{
            anchors.centerIn: parent;
            text:messagex_text
            color: "white";
            font.pixelSize: JS.dpX(15);
            z:10;
        }

    }
    SequentialAnimation{
        id:back_animation;

        NumberAnimation {
            target: exit_rect;
            property: "opacity";
            duration: 1000;
            to:100;
            easing.type: Easing.InCubic;
        }
        NumberAnimation {
            target: exit_rect;
            property: "opacity";
            duration: 1000;
            to:100;
            easing.type: Easing.InOutQuad;
        }
        NumberAnimation {
            target: exit_rect;
            property: "opacity";
            duration: 1000;
            to:0;
            easing.type: Easing.InOutQuad;
        }

    }


}
