#include "ClientSocket.h"
#include <QHostAddress>

ClientSocket::ClientSocket()
{
    //QObject::connect(this,SIGNAL(disconnected()),this,SLOT() );
}

void ClientSocket::setUserid_pass(QString userid,QString userpass)
{
    input_userid = userid;
    input_userpass = userpass;
}

//登陆
void ClientSocket::run()
{
    socket = new QTcpSocket();

    socket->connectToHost(QHostAddress("127.0.0.1") ,8765);

    emit waitforConnected(true);//发出等待信息
    int ok = socket->waitForConnected(3000);
    emit waitforConnected(false);

    if(!ok){
        qDebug()<<"网络有问题";
        emit notFoundNet();
        return ;
    }

    //连接成功进行第一次登陆


    //消息循环
    this->exec();
}
