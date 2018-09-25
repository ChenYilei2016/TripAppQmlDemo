#ifndef NET_NEWS_H
#define NET_NEWS_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QDebug>
#include <QUrl>
#include <QRegExp>
#include <QStringList>
#include <QEventLoop>
#include "replytimeout.h"
#include <QMutex>
#include <QThread>
//base url : http://www.ihchina.cn
//
class Net_news : public QThread
{
    Q_OBJECT
public:
    explicit Net_news(QObject *parent = nullptr);
    ~Net_news();
    Q_PROPERTY(int outTime READ outTime WRITE setOutTime)
    Q_PROPERTY(QString detail_Url READ getDetail_Url WRITE setDetail_Url)
    Q_PROPERTY(int theChoose READ getTheChoose WRITE setTheChoose)

    void toString(QString& buffer)
    {
        QRegExp rx("(\\\\u[0-9a-fA-F]{4})");
        int pos = 0;
        while ((pos = rx.indexIn(buffer, pos)) != -1) {
            buffer.replace(pos++, 6, QChar(rx.cap(1).right(4).toUShort(0, 16)));
        }
    }

    QString mainUrl = "http://www.ihchina.cn/index.html";

//公共属性
public:
    int m_outTime = 1850; //默认1850毫秒
    int outTime() const;
    void setOutTime(int outTime);
    int theChoose = 1;
    int getTheChoose() const;
    void setTheChoose(int value);
    void run();
    Q_INVOKABLE void theWait();

// 获取列表的 标题 和 url
public:
    //获取列表的 标题 和 url
    Q_INVOKABLE void mainRequest();
    QStringList titleList;
    QStringList urlList;
signals:
    void mainSuccessTitleUrl(QStringList m_1,QStringList m_2); //传出 标题列表 传出 url列表
    void mainError(); //连接错误


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// detail的 内容 和图片
public:
    Q_INVOKABLE void detailRequest();
    QString detailText;
    QStringList imageList;

    QString detail_Url = "http://www.ihchina.cn/11/54474.html";
    QString getDetail_Url() const;
    void setDetail_Url(const QString &value);



signals:
    void detailSuccessTextImage(QString m_1,QStringList m_2);
    void detailError();

};

#endif // NET_NEWS_H



