import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("YCH Sandbox")
    color: "#ffffff"

    Rectangle {
        id: rectUI
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        color: "#ffffff"
        gradient: Gradient{
            GradientStop{ position: 1.0; color: "#F1bc09"}
            GradientStop{ position: 0.5; color: "#F1d109"}
            GradientStop{ position: 0.0; color: "#eaf109"}

        }

        Image {
            id: ychLogo
            x: 247
            y: -19
            width: 100
            height: 100
            fillMode: Image.PreserveAspectFit
            source: "Images/YCHLogo.png"
        }
        Text {
            id: textSelActivity
            x: 30
            y: 43
            text: qsTr("Select Activity")
            font.bold: true
            font.pixelSize: 20
        }
        Rectangle {
            id: rectangle
            x: 8
            y: 72
            width: 185
            height: 177
            color: "#e1dea0"
            radius: 15
            border.width: 1

            RadioButton {
                id: radButPickMat
                x: 8
                y: 33
                width: 169
                height: 44
                text: qsTr("Pick Material")
                font.pixelSize: 16
                font.bold: true
                onToggled: {
                    groupBoxPickMat.visible = true
                    groupBoxRefMat.visible = false
                }
            }

            RadioButton {
                id: radioButtonRefiMat
                x: 8
                y: 90
                width: 169
                height: 44
                text: qsTr("Refill Material")
                font.pixelSize: 16
                font.bold: true
                onToggled: {
                    groupBoxPickMat.visible = false
                    groupBoxRefMat.visible = true
                }
            }
        }

        GroupBox {
            id: groupBoxPickMat
            x: 255
            y: 72
            width: 371
            height: 161
            visible: false

            Text {
                id: textEnterSOID
                x: 0
                y: -6
                text: qsTr("Enter/Scan SOID")
                font.pixelSize: 25
                font.bold: true
            }

            TextField {
                id: textFieldSOID
                x: 0
                y: 48
                width: 221
                height: 46
                placeholderText: "Enter SOID"
            }

            Rectangle {
                id: rectangle1
                x: 227
                y: 34
                width: 120
                height: 69
                color: "#eaeae6"
                radius: 15

                Image {
                    id: imagePickup
                    x: -20
                    y: -6
                    width: 161
                    height: 80
                    source: "Images/Pickup.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

        }

        GroupBox {
            id: groupBoxRefMat
            x: 255
            y: 72
            width: 371
            height: 161
            visible: false
            Text {
                id: textEnterSRL
                x: 0
                y: -6
                text: qsTr("Enter/Scan SRL")
                font.pixelSize: 25
                font.bold: true
            }

            TextField {
                id: textFieldSRL
                x: 0
                y: 48
                width: 221
                height: 46
                placeholderText: "Enter SRL"
            }

            Rectangle {
                id: rectangle2
                x: 227
                y: 34
                width: 120
                height: 69
                color: "#eaeae6"
                radius: 15
                Image {
                    id: imagePickup1
                    x: -20
                    y: -6
                    width: 161
                    height: 80
                    source: "Images/Pickup.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

        }
    }

}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
