#ifndef NETREQUEST_DETAIL_H
#define NETREQUEST_DETAIL_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QThread>
#include <QMutex>
#include "replytimeout.h"

#include <qeventloop.h>

class Net_detail_request : public QThread
{
    Q_OBJECT
public:
    Q_PROPERTY(QString url READ url WRITE setUrl)
    Q_PROPERTY(int outtime READ outTime WRITE setOutTime )

    explicit Net_detail_request();
    ~Net_detail_request();


public:
    //QNetworkAccessManager * manager = new QNetworkAccessManager();

    QString url() const;
    void setUrl(const QString &value);

    Q_INVOKABLE void run();
    Q_INVOKABLE bool isRun();
    Q_INVOKABLE void theWait();

    int outTime() const;
    void setOutTime(int outTime);

    QString Space2nbsp(const QString &temp);

signals:
    void responseSuccessful(QString str);
    void responseFaild();
private:
    QString m_url="";
    int m_outTime = 1850;


public slots:
};

#endif // NETREQUEST_H
