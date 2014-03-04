#include <QApplication>
#include <QDeclarativeContext>
#include <QDeclarativeEngine>
#include <QDeclarativeComponent>
#include <QDeclarativeView>
#include <QObject>

#include "callableclass.h"



Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QDeclarativeEngine engine;
    QDeclarativeView view;

    CallableClass callableClass;
    view.rootContext()->setContextProperty("cppObject", &callableClass);

    view.setSource(QUrl::fromLocalFile("qml/y86sim/main.qml"));
    view.show();

    return app.exec();
}
