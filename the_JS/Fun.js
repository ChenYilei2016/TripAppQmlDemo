
var testList = ['123','789']

//根据 网络定位 选择 技艺地区
function place_netsuccess(){
    var needplace
    var theIndex
    if( -1 == the_place ){
        needplace =  netRequest.province() //获得获取的地址
        theIndex = JS.place_list.indexOf(needplace)
        if( -1 == theIndex ){
            theIndex = 23
        }
        the_place = theIndex
    }

    place_choose(the_place)
}

//选择技艺地区
function place_choose(index){
    var item = JS.theStackview.push( Qt.createComponent('qrc:/QML_scroll/Scroll_list.qml') )
    item.theTitle =JS.place_list[index] +'-传统技艺'
    item.urllist  =JS.url_list[index]
    item.textlist =JS.detail_list[index]
}

//返回主页面
function toMain(){
    while( JS.theStackview.depth >1 ){
        JS.theStackview.pop()
    }
}

//有Error 不能访问  上下文的QML内容
WorkerScript.onMessage = function(msg) {
    if(msg == 'mainRequest'){ //获得 新闻列表
        net_btn.enabled = false
        net_News.mainRequest()
    }
    else if(msg == 'detail_request'){ //获得新闻内容
        net_News.detail_Url = mainUrl
        net_News.detailRequest()
    }
    else if( msg =='netLink'){ //各地传统技艺
        net_Detail_Request.outtime = 1850
        net_Detail_Request = mainurl
        net_Detail_Request.run()
    }
}
