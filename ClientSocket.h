#ifndef CLIENTSOCKET_H
#define CLIENTSOCKET_H

#include <QObject>
#include <QTcpSocket>
#include <QThread>

class ClientSocket : public QThread
{
    Q_OBJECT
public:
    ClientSocket();


public:
    Q_INVOKABLE void setUserid_pass(QString userid,QString userpass);

private:
    QTcpSocket * socket =NULL ;
    QString input_userid = "";
    QString input_userpass = "";

private slots:


signals:
    void waitforConnected(bool iswait); //是否等待 连接
    void notFoundNet(); //没有网络


    // QThread interface
protected:
    void run();
};

#endif // CLIENTSOCKET_H
