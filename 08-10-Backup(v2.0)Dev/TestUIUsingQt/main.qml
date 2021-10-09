import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQml 2.12


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Test")
    color: "grey"

    Button {
        id: buttonON
        x: 113
        y: 185
        width: 128
        height: 58
        text: qsTr("ON")
        font.bold: true
        onClicked: {
            backend.toArd("ON")

        }
    }

    Button {
        id: buttonOFF
        x: 409
        y: 185
        width: 128
        height: 58
        text: qsTr("OFF")
        font.bold: true
        onClicked: {
            backend.toArd("OFF")

        }
    }
    Connections{
        target: backend
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:2}
}
##^##*/
