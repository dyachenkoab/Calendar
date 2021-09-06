#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "data.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Data data;
    qRegisterMetaType<QList<Note>>();

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    engine.rootContext()->setContextProperty("notes", &data);

    return app.exec();
}
