#ifndef NETREQUEST_H
#define NETREQUEST_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QMutex>

/**
 *
 * 搜索自身所在的区域类
 *
 */

class QNetworkReply;
class QNetworkAccessManager;

class NetRequest : public QObject
{
    Q_OBJECT
public:
    explicit NetRequest(QObject *parent = nullptr);
    Q_PROPERTY(QStringList list READ getList WRITE setList )

public:
    QNetworkAccessManager * manager = new QNetworkAccessManager(this);

    void toString(QString& buffer)
    {
        QRegExp rx("(\\\\u[0-9a-fA-F]{4})");
        int pos = 0;
        while ((pos = rx.indexIn(buffer, pos)) != -1) {
            buffer.replace(pos++, 6, QChar(rx.cap(1).right(4).toUShort(0, 16)));
        }
    }

    void totoString(QString& buffer)
    {
        buffer.replace('"',"'");

    }
    Q_INVOKABLE QString province() const;

    Q_INVOKABLE QStringList getList() const;
    Q_INVOKABLE void setList(const QStringList &list);
    Q_INVOKABLE void requestUrl();

signals:
    void netsuccess(QString str);
    void neterror();
public:
    QString m_url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js";
private:
    QString m_province = "";
    QStringList m_list;

public slots:
    void replyFinished(QNetworkReply *);

};

#endif // NETREQUEST_H
