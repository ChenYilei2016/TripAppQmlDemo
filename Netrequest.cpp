#include "Netrequest.h"
#include <QDebug>
#include <QUrl>
#include <qtextcodec.h>

#include <QRegExp>


NetRequest::NetRequest(QObject *parent) : QObject(parent)
{
    QObject::connect( manager,SIGNAL(finished(QNetworkReply*)),this,SLOT(replyFinished(QNetworkReply*))  );
}

QString NetRequest::province() const
{
    return m_province;
}

QStringList NetRequest::getList() const
{
    return m_list;
}

void NetRequest::setList(const QStringList &list)
{
    m_list = list;
}

void NetRequest::requestUrl()
{
    static QMutex mutex;
    mutex.lock();
    manager->get(QNetworkRequest(QUrl("http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js") ) );
    mutex.unlock();
}

void NetRequest::replyFinished(QNetworkReply *reply)
{
    QString str = reply->readAll();

    toString(str);

    totoString(str);

    QString pattern(".*'province':'(.*)','city'.*");
    QRegExp rx(pattern);
    rx.setCaseSensitivity(Qt::CaseInsensitive);

    rx.indexIn(str);

    m_province = rx.capturedTexts()[1] ;

    if(m_province.isEmpty()){
        emit neterror();
    }
    else{
        emit netsuccess(m_province);
    }

}
