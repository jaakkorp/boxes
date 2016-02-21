#include "settings.h"
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(new QApplication(argc, argv));
    auto settings = new Settings(app.data());

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("Settings", settings);
    engine.load(QUrl("qrc:/main.qml"));

    return app->exec();
}
