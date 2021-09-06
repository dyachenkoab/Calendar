#include "data.h"

Data::Data( QObject *parent ) : QObject( parent )
{
    initTestData();
}

bool compareNote( const Note &n1, const Note &n2 )
{
    if ( n1.m_time.hour() < n2.m_time.hour() ) {
        return true;
    }
    if ( n1.m_time.hour() == n2.m_time.hour() &&
         n1.m_time.minute() < n2.m_time.minute() ) {
        return true;
    }
    return false;
}

int rand()
{
    return qrand() % 6;
}

QList<Note> Data::getNotes( const QDate &date )
{
    QList<Note> list = data.values( date );
    std::sort( list.begin(), list.end(), compareNote );
    return list;
}

void Data::initTestData()
{
    QDate dt = QDate::fromString( "01.09.2021", "dd.MM.yyyy" );
    QTime tm = QTime::currentTime();
    const QVector<QString> v { "Conference", "Meeting", "Hair cut",
                               "Shopping", "Work", "Date" };

    for ( int i = 1; i < 30; i++ ) {
        for ( int j = 0, count = rand(); j < count; j++) {
            data.insert( dt, Note( v.at( rand() ), tm.addSecs( i * 60 * ( rand() ) ) ) );
        }
        dt = dt.addDays( 1 );
    }
}
