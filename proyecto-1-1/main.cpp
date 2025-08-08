#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine motorQML;
    const QUrl url(QStringLiteral("qrc:/proyecto-1-1/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    motorQML.load(QUrl(QStringLiteral("qrc:/proyecto-1-1/Main.qml")));

    return app.exec();
}
