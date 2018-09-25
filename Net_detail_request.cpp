#include "Net_detail_request.h"
#include <QDebug>
#include <QUrl>
#include <qtextcodec.h>

#include <QRegExp>


Net_detail_request::Net_detail_request()
{
}

Net_detail_request::~Net_detail_request()
{
}

QString Net_detail_request::url() const
{
    return m_url;
}

void Net_detail_request::setUrl(const QString &value)
{
    m_url = value;
}



void Net_detail_request::run()
{
    this->setPriority(QThread::HighestPriority);
    QNetworkAccessManager * manager = new QNetworkAccessManager();
    QNetworkRequest request;
    request.setUrl(QUrl(m_url) );
    QNetworkReply * qreply= manager->get(request );
    QReplyTimeout pTimeout(qreply, m_outTime);

    //下载超时
    connect(&pTimeout, &QReplyTimeout::timeout, [=]() {
        qDebug() << "Timeout";
        emit responseFaild();
        this->quit();
    });

    //多线程下载数据 成功
    connect(manager,&QNetworkAccessManager::finished,[=](){
        QString str = qreply->readAll();
        if(!str.isEmpty()){ //不是空的 请求成功
            QString pattern("<div id=\"jianjie\" class=\"gjmljianjie\">(.*)<!--内容分页控件-->.*");
            QRegExp rx(pattern);

            rx.indexIn(str);
            qreply->abort();
            emit responseSuccessful(Space2nbsp(rx.capturedTexts()[1]));
            this->quit();
        }
    });

    this->exec();
}

bool Net_detail_request::isRun()
{
    return this->isRunning();
}

void Net_detail_request::theWait()
{
    this->wait();
}

int Net_detail_request::outTime() const
{
    return m_outTime;
}

void Net_detail_request::setOutTime(int outTime)
{
    m_outTime = outTime;
}

QString Net_detail_request::Space2nbsp(const QString& temp)
{
    return temp.trimmed().replace("　","&nbsp;&nbsp;&nbsp;&nbsp;");
}


