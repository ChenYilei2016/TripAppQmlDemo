#ifndef KEYFILTER_H
#define KEYFILTER_H

#include <QObject>


class KeyFilter : public QObject
{
    Q_OBJECT
public:

    static KeyFilter* GetInstance();
    explicit KeyFilter(QObject *parent = 0);
    //设置过滤对象
    void SetFilter(QObject *obj);
protected:
    //事件过滤
    bool eventFilter(QObject *watched, QEvent *event);
private:

signals:
    void sig_KeyBackPress();
    void sig_AppExit();
public slots:

};

#endif // KEYFILTER_H
