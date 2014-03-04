#include "callableclass.h"

QString CallableClass::asm2opcode(QString rawasm){
    return rawasm.append("\ntestOK");
}

bool CallableClass::y86SimInit(QString rawopcode){
    opcode=rawopcode;
    simulator_status=0;
    y86_memory=new Memory;
    y86_register=new Register;
    y86_pipeline=new Pipeline(y86_memory,y86_register);

    bool ok=true;
    for (int i=0;i<opcode.length();i++){
        y86_memory->set1(i,opcode.mid(i,1).toInt(&ok,16));
        if (!ok)
            break;
    }

    return ok;

}

void CallableClass::y86SimRun(){

}

void CallableClass::y86SimStep(){
    simulator_status+=1;
    y86_pipeline->step();

}

void CallableClass::y86SimReset(){
    delete y86_memory;
    delete y86_register;
    delete y86_pipeline;
    y86SimInit(opcode);

}

QVariantMap CallableClass::y86data(){
    QVariantMap d;

    d["opcode"]=opcode;
    d["cycles"]=simulator_status;

    d["f_predPC"]=y86_pipeline->F_predPC;


    d["d_icode"]=y86_pipeline->D_icode;
    d["d_ifun"]=y86_pipeline->D_ifun;
    d["d_rA"]=y86_pipeline->D_rA;
    d["d_rB"]=y86_pipeline->D_rB;
    d["d_valC"]=y86_pipeline->D_valC;
    d["d_valP"]=y86_pipeline->D_valP;


    d["e_icode"]=y86_pipeline->E_icode;
    d["e_ifun"]=y86_pipeline->E_ifun;
    d["e_valC"]=y86_pipeline->E_valC;
    d["e_srcA"]=y86_pipeline->E_srcA;
    d["e_valA"]=y86_pipeline->E_valA;
    d["e_srcB"]=y86_pipeline->E_srcB;
    d["e_valB"]=y86_pipeline->E_valB;
    d["e_dstE"]=y86_pipeline->E_dstE;
    d["e_dstM"]=y86_pipeline->E_dstM;

    d["m_icode"]=y86_pipeline->M_icode;
    d["m_ifun"]=y86_pipeline->M_ifun;
    d["m_valA"]=y86_pipeline->M_valA;
    d["m_dstE"]=y86_pipeline->M_dstE;
    d["m_dstM"]=y86_pipeline->M_dstM;
    d["m_Bch"]=y86_pipeline->M_Bch;

    d["w_icode"]=y86_pipeline->W_icode;
    d["w_dstE"]=y86_pipeline->W_dstE;
    d["w_valE"]=y86_pipeline->W_valE;
    d["w_dstM"]=y86_pipeline->W_dstM;
    d["w_valM"]=y86_pipeline->W_valM;

    return d;
}
