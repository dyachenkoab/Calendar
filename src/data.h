#ifndef DATA_H
#define DATA_H

#include <QDate>
#include <QDebug>
#include <QObject>
#include <QTime>

struct Note {
    Q_GADGET
    Q_PROPERTY( QString name MEMBER m_name )
    Q_PROPERTY( QTime time MEMBER m_time )

public:
    QString m_name;
    QTime m_time;
    Note() {}
    Note( const QString &_name, const QTime &_time )
    {
        m_name = _name;
        m_time = _time;
    }
    ~Note() = default;
};
Q_DECLARE_METATYPE( Note )

class Data : public QObject
{
    Q_OBJECT
    QMultiHash<QDate, Note> data;
    void initTestData();

public:
    explicit Data( QObject *parent = nullptr );

public slots:
    QList<Note> getNotes( const QDate &date );
};

#endif // DATA_H
