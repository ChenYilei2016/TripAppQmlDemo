#include "Net_news.h"



Net_news::Net_news(QObject *parent)
{

}

Net_news::~Net_news()
{

}

int Net_news::outTime() const
{
    return m_outTime;
}

void Net_news::setOutTime(int outTime)
{
    m_outTime = outTime;
}

int Net_news::getTheChoose() const
{
    return theChoose;
}

void Net_news::setTheChoose(int value)
{
    theChoose = value;
}

void Net_news::run()
{
    this->setPriority(QThread::HighestPriority);
    if(1 == theChoose){ //main
        mainRequest();
    }
    else if(2 == theChoose){ //detail
        detailRequest();
    }
}

void Net_news::theWait()
{
    this->wait();
}

void Net_news::mainRequest()
{
    QNetworkAccessManager * manager = new QNetworkAccessManager();
    QNetworkRequest request;
    request.setHeader(QNetworkRequest::UserAgentHeader,"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.4549.400 QQBrowser/9.7.12900.400");
    request.setUrl(QUrl( "http://www.ihchina.cn/index.html"  ) );
    QNetworkReply * qreply= manager->get(request );

    QReplyTimeout pTimeout(qreply, m_outTime);

    //下载超时
    connect(&pTimeout, &QReplyTimeout::timeout, [=]() {
        qDebug() << "Timeout";
        emit mainError();
        this->quit();
    });

    //多线程下载数据 成功
    connect(manager,&QNetworkAccessManager::finished,[=](){
        QString str = qreply->readAll();
        toString(str);

        if(!str.isEmpty()){ //不是空的 请求成功
            QString pattern("<!-- 新闻动态-->(.*)<a href=\"11/11_1.html\">更多>></a>");
            int pos = 0;
            QRegExp rx(pattern);

            rx.indexIn(str);
            str = rx.capturedTexts()[1]; // 获得 title + url

            QRegExp rx2("<a title=\"(.*)\" href='(.*)' target=\"_blank\">");
            rx2.setMinimal(true);

            while( (pos=rx2.indexIn(str,pos))!=-1 ){
                titleList.push_back( rx2.cap(1) );
                urlList.push_back("http://www.ihchina.cn/"+rx2.cap(2)  );
                pos += rx2.matchedLength();
            }

            qreply->abort();

            emit mainSuccessTitleUrl( titleList,urlList );
            this->quit();
        }
       });


    this->exec();
}


void Net_news::detailRequest()
{

        QNetworkAccessManager * manager = new QNetworkAccessManager();
        QNetworkRequest request;
        request.setHeader(QNetworkRequest::UserAgentHeader,"Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.4549.400 QQBrowser/9.7.12900.400");
        request.setUrl(QUrl( detail_Url  ) );
        QNetworkReply * qreply= manager->get(request );

        QReplyTimeout *pTimeout = new QReplyTimeout(qreply, m_outTime);

        //下载超时
        connect(pTimeout, &QReplyTimeout::timeout, [=]() {
            qDebug() << "Timeout";
            emit detailError();
            this->quit();
        });

        //多线程下载数据 成功
        connect(manager,&QNetworkAccessManager::finished,[=](){
                QString str = qreply->readAll();
                toString(str);

                if(!str.isEmpty()){ //不是空的 请求成功
                    int pos = 0;

                    QString pt1("<div id=\"detailNews\" class=\"detailNews\">(.*)<!--内容分页控件-->");
                    QRegExp rx(pt1);

                    rx.indexIn(str);
                    str = rx.capturedTexts()[0].trimmed(); // 内容 + 图片

                    QString pt2("<img src=\"(.*jpg).*\"/>");
                    QRegExp rx2(pt2);
                    rx2.setMinimal(true);

                    while( (pos=rx2.indexIn(str,pos))!=-1 ){
                        imageList.push_back("http://www.ihchina.cn"+rx2.cap(1) );
                        pos += rx2.matchedLength();

                    }
                    str.replace(rx2,"");
                    qreply->abort();

                    emit detailSuccessTextImage(str,imageList);
                    this->quit();
               }

           });


        this->exec();
}

QString Net_news::getDetail_Url() const
{
    return detail_Url;
}

void Net_news::setDetail_Url(const QString &value)
{
    detail_Url = value;
}



