// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 800
    height: 480

    Image {
        id: image1
        x: 0
        y: 0
        width: 800
        height: 480
        source: "../../res/background-2.png"

        Image {
            id: image2
            x: 135
            y: 123
            width: 200
            height: 240
            source: "../../res/inputarea.png"

            TextEdit {
                id: text_input1
                x: 12
                y: 12
                width: 173
                height: 216
                text: qsTr("Input your Y86 code here.")
                font.pixelSize: 11
                font.family: "Droid Sans Mono"
            }
        }

        Image {
            id: image3
            x: 469
            y: 123
            width: 200
            height: 240
            TextEdit {
                id: text_input2
                x: 12
                y: 12
                width: 173
                height: 216
                text: "Or machine code here."
                font.pixelSize: 11
                font.family: "Droid Sans Mono"
            }
            source: "../../res/inputarea.png"
        }
        MouseArea {
            id: mouse_area1
            x: 600
            y: 390
            width: 120
            height: 37
            onClicked: {
                if (cppObject.y86SimInit(text_input2.text)){
                    var object = Qt.createComponent("simulator.qml")
                    var window = object.createObject(parent);
                }
            }
            Image {
                id: image4
                x: 0
                y: 0
                width: 120
                height: 37
                fillMode: Image.Tile
                sourceSize.height: 36
                sourceSize.width: 121
                source: "../../res/button-normal.png"
            }

            Text {
                id: text3
                x: 37
                y: 7
                color: "#ffffff"
                text: qsTr("Next")
                font.bold: true
                font.family: "Droid Sans"
                wrapMode: Text.WordWrap
                styleColor: "#ffffff"
                font.pixelSize: 20
            }


        }

        MouseArea {
            id: mouse_area2
            x: 340
            y: 222
            width: 120
            height: 37
            onClicked: {
                text_input2.text=cppObject.asm2opcode(text_input1.text)
            }
            Image {
                id: image5
                x: 0
                y: 0
                width: 120
                height: 37
                source: "../../res/button-normal.png"
                sourceSize.width: 121
                fillMode: Image.Tile
                sourceSize.height: 36
            }

            Text {
                id: text4
                x: 14
                y: 7
                color: "#ffffff"
                text: qsTr("Translate")
                font.pixelSize: 20
                wrapMode: Text.WordWrap
                styleColor: "#ffffff"
                font.bold: true
                font.family: "Droid Sans"
            }
        }
    }
    states: [
        State {
            name: "State1"

            PropertyChanges {
                target: image4
                source: "../../res/button-active.png"
            }
            when: mouse_area1.pressedButtons
        },
        State {
            name: "State2"
            PropertyChanges {
                target: image4
                source: "../../res/button-normal.png"
            }

            PropertyChanges {
                target: image5
                source: "../../res/button-active.png"
            }
            when: mouse_area2.pressedButtons
        }
    ]
    }

