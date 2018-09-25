#ifndef REPLYTIMEOUT_H
#define REPLYTIMEOUT_H

/**
QReplyTimeout类 控制超时时间

**/


#include <QObject>
#include <QTimer>
#include <QNetworkReply>

class QReplyTimeout : public QObject {

    Q_OBJECT

public:
    QTimer timer;
    QNetworkReply *treply = NULL;

    QReplyTimeout(QNetworkReply *reply, const int timeout) : QObject(reply) {
        Q_ASSERT(reply);
           treply = static_cast<QNetworkReply*>(parent());
        //if (reply && reply->isRunning()) {  // 启动单次定时器
           QObject::connect(&timer,SIGNAL(timeout()),this,SLOT(onTimeout()) );
           timer.setInterval(timeout);
           timer.start();
        //}
    }
    ~QReplyTimeout(){
        timer.stop();
        if(NULL != treply){
            treply->abort();
            treply->deleteLater();
            treply = NULL;
        }
    }

signals:
    void timeout();  // 超时信号 - 供进一步处理

private slots:
    void onTimeout() {  // 处理超时
        //if (reply->isRunning()) {
            emit timeout();
            treply->abort();
            treply->deleteLater();
            treply = NULL;
       // }
    }
};

#endif // REPLYTIMEOUT_H
