#ifndef CALLABLECLASS_H
#define CALLABLECLASS_H

#include <QObject>
#include <QString>
#include <QVariantMap>

#include "pipeline.h"

class CallableClass : public QObject
{
    Q_OBJECT
public:
    QString opcode;
    int simulator_status;
    Memory *y86_memory;
    Register *y86_register;
    Pipeline *y86_pipeline;
signals:
    
public slots:
     QString asm2opcode(QString);
     bool y86SimInit(QString);
     void y86SimRun();
     void y86SimStep();
     void y86SimReset();
     QVariantMap y86data();
};

#endif // CALLABLECLASS_H
