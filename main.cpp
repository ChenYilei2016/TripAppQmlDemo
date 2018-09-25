#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QtQml>
#include <QDebug>
#include "KeyFilter.h"
#include "Netrequest.h"

#include "Net_detail_request.h"

#include "Net_news.h"

#include "ClientSocket.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    NetRequest tempnetrequest;

    app.setOrganizationName("Chenyilei");
    app.setOrganizationDomain("Chenyilei.com");
    app.setApplicationName("ZhaoHuaXiShi");

    qmlRegisterType<Net_detail_request>("NetREQUEST", 1, 0, "R_net_detail_request");//周围类   QML导入的时候就是import GLY.MyClass 1.0
    qmlRegisterType<Net_news>("NET_news", 1, 0, "R_net_news");//查询 新闻 类


    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("keyFilter", KeyFilter::GetInstance());
    engine.rootContext()->setContextProperty("netRequest",&tempnetrequest);
    engine.rootContext()->setContextProperty("clientSocket",new ClientSocket() ); //通讯服务器类

    QQmlComponent component(&engine, QUrl("qrc:/main.qml"));
    //获取对象
    QObject *object = component.create();
    //添加过滤器
    KeyFilter::GetInstance()->SetFilter(object);

    return app.exec();
}
