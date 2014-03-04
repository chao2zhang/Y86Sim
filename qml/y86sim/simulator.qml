// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 800
    height: 480
    function refresh() {

        console.log(cppObject.y86data()["opcode"])

        cycles.text=cppObject.y86data()["cycles"]

        f_predPC.text=cppObject.y86data()["f_predPC"]

        d_icode.text=cppObject.y86data()["d_icode"]
        d_ifun.text=cppObject.y86data()["d_ifun"]
        d_rA.text=cppObject.y86data()["d_rA"]
        d_rB.text=cppObject.y86data()["d_rB"]
        d_valC.text=cppObject.y86data()["d_valC"]
        d_valP.text=cppObject.y86data()["d_valP"]

        e_icode.text=cppObject.y86data()["e_icode"]
        e_ifun.text=cppObject.y86data()["e_ifun"]
        e_valC.text=cppObject.y86data()["e_valC"]
        e_srcA.text=cppObject.y86data()["e_srcA"]
        e_valA.text=cppObject.y86data()["e_valA"]
        e_srcB.text=cppObject.y86data()["e_srcB"]
        e_valB.text=cppObject.y86data()["e_valB"]
        e_dstE.text=cppObject.y86data()["e_dstE"]
        e_dstM.text=cppObject.y86data()["e_dstM"]

        m_icode.text=cppObject.y86data()["m_icode"]
        //m_ifun.text=cppObject.y86data()["m_ifun"]
        m_valA.text=cppObject.y86data()["m_valA"]
        m_dstE.text=cppObject.y86data()["m_dstE"]
        m_dstM.text=cppObject.y86data()["m_dstM"]
        m_Bch.text=cppObject.y86data()["m_Bch"]

        w_icode.text=cppObject.y86data()["w_icode"]
        w_dstE.text=cppObject.y86data()["w_dstE"]
        w_valE.text=cppObject.y86data()["w_valE"]
        w_dstM.text=cppObject.y86data()["w_dstM"]
        w_valM.text=cppObject.y86data()["w_valM"]


    }

    Image {
        id: image1
        x: 0
        y: 0
        width: 800
        height: 480
        source: "../../res/background-3.png"

        Text {
            id: text1
            x: 111
            y: 134
            color: "#626262"
            text: qsTr("icode")
            font.bold: true
            font.family: "Droid Sans Mono"
            font.pixelSize: 14
        }

        Text {
            id: text2
            x: 111
            y: 193
            color: "#626262"
            text: qsTr("icode")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text3
            x: 111
            y: 259
            color: "#626262"
            text: qsTr("icode")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text4
            x: 111
            y: 323
            color: "#626262"
            text: qsTr("icode")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text5
            x: 236
            y: 134
            width: 32
            height: 16
            color: "#626262"
            text: qsTr("valE")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text6
            x: 306
            y: 134
            color: "#626262"
            text: qsTr("valM")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: text7
            x: 380
            y: 134
            color: "#626262"
            text: qsTr("dstE")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text8
            x: 414
            y: 134
            color: "#626262"
            text: qsTr("dstM")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text9
            x: 171
            y: 193
            color: "#626262"
            text: qsTr("Bch")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: text10
            x: 236
            y: 193
            color: "#626262"
            text: qsTr("valE")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: text11
            x: 306
            y: 193
            color: "#626262"
            text: qsTr("valA")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text12
            x: 380
            y: 193
            color: "#626262"
            text: qsTr("dstE")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: text13
            x: 414
            y: 193
            color: "#626262"
            text: qsTr("dstM")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: text14
            x: 155
            y: 259
            color: "#626262"
            text: qsTr("ifun")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: text15
            x: 218
            y: 259
            color: "#626262"
            text: qsTr("valC")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text16
            x: 273
            y: 259
            color: "#626262"
            text: qsTr("valA")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: text17
            x: 325
            y: 259
            color: "#626262"
            text: qsTr("valB")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text18
            x: 380
            y: 259
            color: "#626262"
            text: qsTr("dstE")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text19
            x: 414
            y: 259
            color: "#626262"
            text: qsTr("dstM")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text20
            x: 448
            y: 259
            color: "#626262"
            text: qsTr("srcA")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: text21
            x: 482
            y: 259
            color: "#626262"
            text: qsTr("srcB")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text22
            x: 155
            y: 323
            color: "#626262"
            text: qsTr("ifun")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text23
            x: 193
            y: 323
            color: "#626262"
            text: qsTr("rA")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: text24
            x: 223
            y: 323
            color: "#626262"
            text: qsTr("rB")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text25
            x: 265
            y: 323
            color: "#626262"
            text: qsTr("valC")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: text26
            x: 336
            y: 323
            color: "#626262"
            text: qsTr("valP")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text27
            x: 155
            y: 382
            color: "#626262"
            text: qsTr("predPC")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: e_valC
            x: 195
            y: 284
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: e_valA
            x: 259
            y: 284
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: e_valB
            x: 322
            y: 284
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: e_dstE
            x: 386
            y: 284
            width: 25
            height: 13
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: e_dstM
            x: 418
            y: 284
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: e_srcA
            x: 452
            y: 284
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: e_srcB
            x: 486
            y: 284
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: m_dstE
            x: 386
            y: 221
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: m_dstM
            x: 418
            y: 221
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: m_valE
            x: 222
            y: 221
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: m_valA
            x: 292
            y: 221
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: w_valE
            x: 222
            y: 162
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: w_valM
            x: 292
            y: 162
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: d_valC
            x: 251
            y: 348
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: d_valP
            x: 322
            y: 348
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: w_dstE
            x: 386
            y: 162
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: w_dstM
            x: 418
            y: 162
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: d_rA
            x: 188
            y: 348
            width: 25
            height: 13
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: d_rB
            x: 218
            y: 348
            width: 25
            height: 13
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: f_predPC
            x: 149
            y: 406
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: m_Bch
            x: 171
            y: 221
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: m_icode
            x: 119
            y: 221
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: e_icode
            x: 119
            y: 284
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: d_icode
            x: 119
            y: 348
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: w_icode
            x: 119
            y: 162
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: text53
            x: 545
            y: 134
            color: "#626262"
            text: qsTr("%eax")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text54
            x: 545
            y: 164
            color: "#626262"
            text: qsTr("%ebx")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: text55
            x: 545
            y: 193
            color: "#626262"
            text: qsTr("%ecx")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text56
            x: 545
            y: 220
            color: "#626262"
            text: qsTr("%edx")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: eax
            x: 586
            y: 136
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: ebx
            x: 586
            y: 165
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: ecx
            x: 586
            y: 195
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: edx
            x: 586
            y: 221
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: text61
            x: 652
            y: 134
            color: "#626262"
            text: qsTr("%edi")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: text62
            x: 652
            y: 164
            color: "#626262"
            text: qsTr("%esi")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text63
            x: 652
            y: 193
            color: "#626262"
            text: qsTr("%ebp")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: text64
            x: 652
            y: 220
            color: "#626262"
            text: qsTr("%esp")
            font.pixelSize: 14
            font.bold: true
            font.family: "Droid Sans Mono"
        }

        Text {
            id: edi
            x: 692
            y: 136
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: esi
            x: 692
            y: 165
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: ebp
            x: 692
            y: 195
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        Text {
            id: esp
            x: 692
            y: 221
            color: "#474747"
            text: qsTr("0x00000000")
            font.pixelSize: 11
        }

        MouseArea {
            id: mouse_area1
            x: 550
            y: 352
            width: 58
            height: 25
            onClicked: {


            }

            Image {
                id: button1
                x: 0
                y: 0
                width: 58
                height: 25
                smooth: true
                fillMode: Image.Stretch
                source: "../../res/button-normal.png"

                Text {
                    id: text28
                    x: 17
                    y: 5
                    color: "#ffffff"
                    text: qsTr("Auto")
                    font.pixelSize: 12
                }
            }
        }

        MouseArea {
            id: mouse_area2
            x: 621
            y: 352
            width: 58
            height: 25
            onClicked: {
                cppObject.y86SimStep()
                refresh();
            }
            Image {
                id: button2
                x: 0
                y: 0
                width: 58
                height: 25
                smooth: true
                source: "../../res/button-normal.png"
                fillMode: Image.Stretch

                Text {
                    id: text29
                    x: 17
                    y: 5
                    color: "#ffffff"
                    text: qsTr("Step")
                    font.pixelSize: 12
                }
            }
        }

        MouseArea {
            id: mouse_area3
            x: 693
            y: 352
            width: 58
            height: 25
            onClicked: {
                cppObject.y86SimReset()
                refresh();
            }
            Image {
                id: button3
                x: 0
                y: 0
                width: 58
                height: 25
                smooth: true
                source: "../../res/button-normal.png"
                fillMode: Image.Stretch

                Text {
                    id: text30
                    x: 14
                    y: 5
                    color: "#ffffff"
                    text: qsTr("Reset")
                    font.pixelSize: 12
                }
            }
        }

        MouseArea {
            id: mouse_area4
            x: 600
            y: 390
            width: 119
            height: 36
            onClicked: {
                var object = Qt.createComponent("assembler.qml")
                var window = object.createObject(parent);
            }
            Image {
                id: button4
                x: 0
                y: 0
                width: 119
                height: 36
                smooth: true
                fillMode: Image.Tile
                source: "../../res/button-normal.png"

                Text {
                    id: text31
                    x: 36
                    y: 6
                    color: "#ffffff"
                    text: qsTr("Back")
                    font.bold: true
                    font.family: "Droid Sans"
                    font.pixelSize: 20
                }
            }
        }

        Image {
            id: image3
            x: 583
            y: 321
            width: 177
            height: 26
            smooth: true
            fillMode: Image.Stretch
            source: "../../res/slider-back.png"
        }

        Image {
            id: image4
            x: 594
            y: 321
            width: 45
            height: 26
            smooth: true
            source: "../../res/slider-top.png"
        }

        Text {
            id: text57
            x: 545
            y: 325
            color: "#626262"
            text: qsTr("Freq")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: text58
            x: 613
            y: 268
            color: "#626262"
            text: qsTr("cycles")
            font.pixelSize: 14
            font.family: "Droid Sans Mono"
            font.bold: true
        }

        Text {
            id: cycles
            x: 675
            y: 270
            color: "#474747"
            text: qsTr("0")
            font.pixelSize: 11
        }

        Text {
            id: e_ifun
            x: 159
            y: 284
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

        Text {
            id: d_ifun
            x: 155
            y: 348
            color: "#474747"
            text: qsTr("none")
            font.pixelSize: 11
        }

    }
    states: [
        State {
            name: "State1"

            PropertyChanges {
                target: button1
                source: "../../res/button-active.png"
            }
            when: mouse_area1.pressedButtons
        },
        State {
            name: "State2"
            PropertyChanges {
                target: button1
                source: "../../res/button-normal.png"
            }

            PropertyChanges {
                target: button2
                source: "../../res/button-active.png"
            }
            when: mouse_area2.pressedButtons
        },
        State {
            name: "State3"
            PropertyChanges {
                target: button1
                source: "../../res/button-normal.png"
            }

            PropertyChanges {
                target: button2
                source: "../../res/button-normal.png"
            }

            PropertyChanges {
                target: button3
                source: "../../res/button-active.png"
            }
            when: mouse_area3.pressedButtons
        },
        State {
            name: "State4"
            PropertyChanges {
                target: button1
                source: "../../res/button-normal.png"
            }

            PropertyChanges {
                target: button2
                source: "../../res/button-normal.png"
            }

            PropertyChanges {
                target: button3
                source: "../../res/button-normal.png"
            }

            PropertyChanges {
                target: button4
                source: "../../res/button-active.png"
            }
            when: mouse_area4.pressedButtons
        }
    ]

}
