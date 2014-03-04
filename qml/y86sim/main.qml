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
        fillMode: Image.Tile
        source: "../../res/background-1.png"

        Text {
            id: text1
            x: 120
            y: 170
            color: "#6d6d6d"
            text: qsTr("Y86 Pipeline Simulator")
            styleColor: "#959595"
            style: Text.Sunken
            font.bold: true
            font.family: "Droid Sans"
            font.pixelSize: 52
        }

        Text {
            id: text2
            x: 342
            y: 300

            color: "#6d6d6d"
            text: qsTr("一个普通的Y86流水线模拟器...")
            font.pixelSize: 24
            style: Text.Normal
            styleColor: "#959595"
            font.family: "Droid Sans"
            font.bold: true
        }

        MouseArea {
            id: mouse_area1
            x: 600
            y: 390
            width: 120
            height: 37
            onClicked: {
                var object = Qt.createComponent("assembler.qml")
                var window = object.createObject(parent);
            }
            Image {
                id: image2
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
    }
    states: [
        State {
            name: "State1"

            PropertyChanges {
                target: image2
                source: "../../res/button-active.png"
            }

            PropertyChanges {
                target: mouse_area1
                x: 600
                y: 390
            }
            when: mouse_area1.pressedButtons
        }
    ]
}
