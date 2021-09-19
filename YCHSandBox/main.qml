import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.10
import QtQml 2.10
import QtQuick.VirtualKeyboard 2.1

Window {
    visible: true
    width: 1024
    height: 600
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
            x: 423
            y: -26
            width: 160
            height: 133
            fillMode: Image.PreserveAspectFit
            source: "Images/YCHLogo.png"
        }
        Text {
            id: textSelActivity
            x: 64
            y: 46
            text: qsTr("Select Activity")
            font.bold: true
            font.pixelSize: 26
        }
        Rectangle {
            id: rectangle
            x: 36
            y: 88
            width: 238
            height: 208
            color: "#e1dea0"
            radius: 15
            border.width: 1

            RadioButton {
                id: radioButtonPickMaterial
                x: 8
                y: 37
                width: 214
                height: 44
                text: qsTr("Pick Material")
                font.pixelSize: 22
                font.bold: true
                onToggled: {
                    groupBoxSOID.visible = true
                    groupBoxDCNumber.visible = false
                    groupBoxDCNumberKeypad.visible = false
                    groupBoxSRL.visible = false
                    groupBoxSRLKeypad.visible = false
                }
            }

            RadioButton {
                id: radioButtonRefillMaterial
                x: 8
                y: 110
                width: 214
                height: 44
                text: qsTr("Refill Material")
                font.pixelSize: 22
                font.bold: true
                onToggled: {
                    groupBoxSOID.visible = false
                    groupBoxSRLKeypad.visible = false
                    groupBoxDCNumber.visible = true
                }
            }
        }

        GroupBox {
            id: groupBoxSOID
            x: 400
            y: 88
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
            id: groupBoxSRL
            x: 400
            y: 88
            width: 371
            height: 170
            visible: false
            Text {
                id: textEnterSRL
                x: 0
                y: -6
                text: qsTr("Enter/Scan SRL Number")
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
                font.bold: true

            }

            Rectangle {
                id: rectImageRefMat
                x: 227
                y: 34
                width: 120
                height: 69
                color: "#eaeae6"
                radius: 15

                Text {
                    id: textForceQuitSRL
                    x: 22
                    y: 48
                    text: qsTr("Force Quit")
                    font.pixelSize: 18
                    font.bold: true
                }
                Image {
                    id: imageSRLForceQuit
                    x: 0
                    y: -7
                    width: 126
                    height: 61
                    source: "Images/Cancel.png"
                    fillMode: Image.PreserveAspectFit

                    MouseArea {
                        id: mouseAreaForceQuitSRL
                        x: 118
                        y: 76
                        width: 113
                        height: 64
                        onClicked: {
                            Qt.quit()
                        }
                    }
                }
            }

            Rectangle {
                id: rectSRLKeypad
                x: 34
                y: 100
                width: 129
                height: 49
                color: "#433d3d"
                radius: 15

                Text {
                    id: textSRLKeypad
                    x: 22
                    y: 8
                    width: 91
                    height: 33
                    color: "#f1efef"
                    text: qsTr("Keypad")
                    font.pixelSize: 25
                    font.bold: true
                }

                MouseArea {
                    id: mouseAreaSRLKeypad
                    x: 0
                    y: 0
                    width: 129
                    height: 49
                    onClicked: {
                        groupBoxSRLKeypad.visible = true
                    }
                }
            }

        }

        Label {
            id: labelWelcomeUser
            x: 798
            y: 89
            width: 211
            height: 111
            visible: true
            font.bold: true
            font.pixelSize: 22


        }

        GroupBox {
            id: groupBoxSRLKeypad
            x: 331
            y: 264
            width: 362
            height: 328
            visible: false



            Rectangle {
                id: rectKey1
                x: 0
                y: 7
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0

                Text {
                    id: text1
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("1")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            MouseArea {
                id: mouseAreaDigit1
                x: 0
                y: 7
                width: 97
                height: 67
                onClicked: {
                    textFieldSRL.text = textFieldSRL.text + "1"

                }
            }

            Rectangle {
                id: rectKey2
                x: 119
                y: 7
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text2
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("2")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey3
                x: 237
                y: 7
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text3
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("3")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey4
                x: 0
                y: 86
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text4
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("4")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey5
                x: 119
                y: 86
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text5
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("5")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey6
                x: 237
                y: 86
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text6
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("6")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey7
                x: 0
                y: 171
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text7
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("7")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey8
                x: 119
                y: 171
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text8
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("8")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey9
                x: 237
                y: 171
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text9
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("9")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey0
                x: 119
                y: 249
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text0
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("0")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            MouseArea {
                id: mouseAreaDigit2
                x: 119
                y: 7
                width: 97
                height: 67
                onClicked: {
                    textFieldSRL.text = textFieldSRL.text + "2"

                }
            }

            MouseArea {
                id: mouseAreaDigit3
                x: 237
                y: 7
                width: 97
                height: 67
                onClicked: {
                    textFieldSRL.text = textFieldSRL.text + "3"

                }
            }

            MouseArea {
                id: mouseAreaDigit4
                x: 0
                y: 86
                width: 97
                height: 67
                onClicked: {
                    textFieldSRL.text = textFieldSRL.text + "4"

                }
            }

            MouseArea {
                id: mouseAreaDigit5
                x: 119
                y: 86
                width: 97
                height: 67
                onClicked: {
                    textFieldSRL.text = textFieldSRL.text + "5"

                }
            }

            MouseArea {
                id: mouseAreaDigit6
                x: 237
                y: 86
                width: 97
                height: 67
                onClicked: {
                    textFieldSRL.text = textFieldSRL.text + "6"

                }
            }

            MouseArea {
                id: mouseAreaDigit7
                x: 0
                y: 171
                width: 97
                height: 67
                onClicked: {
                    textFieldSRL.text = textFieldSRL.text + "7"

                }
            }

            MouseArea {
                id: mouseAreaDigit8
                x: 119
                y: 171
                width: 97
                height: 67
                onClicked: {
                    textFieldSRL.text = textFieldSRL.text + "8"

                }
            }

            MouseArea {
                id: mouseAreaDigit9
                x: 237
                y: 171
                width: 97
                height: 67
                onClicked: {
                    textFieldSRL.text = textFieldSRL.text + "9"

                }
            }

            MouseArea {
                id: mouseAreaDigit0
                x: 119
                y: 249
                width: 97
                height: 67
                onClicked: {
                    textFieldSRL.text = textFieldSRL.text + "0"

                }
            }

            Rectangle {
                id: rectangleCancel
                x: 0
                y: 249
                width: 97
                height: 67
                color: "#fd3a3a"
                radius: 15

                Image {
                    id: imageCancel
                    x: 0
                    y: 0
                    width: 97
                    height: 67
                    source: "Images/Cancel.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                id: rectangleConfirm
                x: 237
                y: 249
                width: 97
                height: 67
                color: "#63f517"
                radius: 15

                Image {
                    id: image
                    x: 0
                    y: 8
                    width: 97
                    height: 51
                    source: "Images/Confirm.png"
                    fillMode: Image.PreserveAspectFit
                }
            }
            MouseArea{
                id: mouseAreaConfirm
                x: 238
                y: 249
                width: 96
                height: 67
                onClicked:{
                    backend.welcomeText(textFieldSRL.text)
                }
            }

        }

        MouseArea {
            id: mouseAreaCancelDCNumber
            x: 338
            y: 528
            width: 97
            height: 64
            onClicked: {
                textFieldDCNumber.text = ""

            }
        }

        GroupBox {
            id: groupBoxDCNumber
            x: 400
            y: 89
            width: 371
            height: 170
            visible: false
            Text {
                id: textEnterDCNumber
                x: 0
                y: -6
                text: qsTr("Enter/Scan DC Number")
                font.pixelSize: 25
                font.bold: true
            }

            TextField {
                id: textFieldDCNumber
                x: 0
                y: 48
                width: 221
                height: 46
                placeholderText: "Enter DC Number"
                font.bold: true
            }

            Rectangle {
                id: rectImageDCNumber
                x: 227
                y: 34
                width: 120
                height: 69
                color: "#eaeae6"
                radius: 15
                Image {
                    id: imageDCNumber
                    x: 10
                    y: -6
                    width: 102
                    height: 60
                    source: "Images/Cancel.png"
                    fillMode: Image.PreserveAspectFit
                    MouseArea {
                        id: mouseAreaForceQuitDCNumber
                        x: -5
                        y: 10
                        width: 113
                        height: 64
                        onClicked: {
                            Qt.quit()
                        }
                    }

                    Text {
                        id: textForceQuitDCNumber
                        x: 8
                        y: 53
                        text: qsTr("Force Quit")
                        font.pixelSize: 18
                        font.bold: true
                    }
                }
            }

            Rectangle {
                id: rectDCNumberKeypad
                x: 34
                y: 100
                width: 129
                height: 49
                color: "#433d3d"
                radius: 15
                Text {
                    id: textDCNumberKeypad
                    x: 22
                    y: 8
                    width: 91
                    height: 33
                    color: "#f1efef"
                    text: qsTr("Keypad")
                    font.pixelSize: 25
                    font.bold: true
                }

                MouseArea {
                    id: mouseAreaDCNumberKeypad
                    x: -1
                    y: -1
                    width: 129
                    height: 49
                    onClicked: {
                        groupBoxDCNumberKeypad.visible = true
                    }
                }
            }
        }

        GroupBox {
            id: groupBoxDCNumberKeypad
            x: 322
            y: 264
            width: 362
            height: 328
            visible: false
            Rectangle {
                id: rectKey10
                x: 0
                y: 7
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text10
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("1")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            MouseArea {
                id: mouseAreaDigit10
                x: 0
                y: 7
                width: 97
                height: 67
                onClicked: {
                            textFieldDCNumber.text = textFieldDCNumber.text + "1"

                        }
            }

            Rectangle {
                id: rectKey11
                x: 119
                y: 7
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text11
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("2")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey12
                x: 237
                y: 7
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text12
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("3")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey13
                x: 0
                y: 86
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text13
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("4")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey14
                x: 119
                y: 86
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text14
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("5")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey15
                x: 237
                y: 86
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text15
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("6")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey16
                x: 0
                y: 171
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text16
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("7")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey17
                x: 119
                y: 171
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text17
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("8")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey18
                x: 237
                y: 171
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text18
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("9")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            Rectangle {
                id: rectKey19
                x: 119
                y: 249
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text19
                    x: 14
                    y: 14
                    width: 69
                    height: 40
                    color: "#f5f4f4"
                    text: qsTr("0")
                    font.pixelSize: 35
                    horizontalAlignment: Text.AlignHCenter
                    font.bold: true
                }
            }

            MouseArea {
                id: mouseAreaDigit11
                x: 119
                y: 7
                width: 97
                height: 67
                onClicked: {
                            textFieldDCNumber.text = textFieldDCNumber.text + "2"

                        }
            }

            MouseArea {
                id: mouseAreaDigit12
                x: 237
                y: 7
                width: 97
                height: 67
                onClicked: {
                           textFieldDCNumber.text = textFieldDCNumber.text + "3"

                        }
            }

            MouseArea {
                id: mouseAreaDigit13
                x: 0
                y: 86
                width: 97
                height: 67
                onClicked: {
                            textFieldDCNumber.text = textFieldDCNumber.text + "4"

                        }
            }

            MouseArea {
                id: mouseAreaDigit14
                x: 119
                y: 86
                width: 97
                height: 67
                onClicked: {
                            textFieldDCNumber.text = textFieldDCNumber.text + "5"

                        }
            }

            MouseArea {
                id: mouseAreaDigit15
                x: 237
                y: 86
                width: 97
                height: 67
                onClicked: {
                            textFieldDCNumber.text = textFieldDCNumber.text + "6"

                        }
            }

            MouseArea {
                id: mouseAreaDigit16
                x: 0
                y: 171
                width: 97
                height: 67
                onClicked: {
                           textFieldDCNumber.text = textFieldDCNumber.text + "7"

                        }
            }

            MouseArea {
                id: mouseAreaDigit17
                x: 119
                y: 171
                width: 97
                height: 67
                onClicked: {
                            textFieldDCNumber.text = textFieldDCNumber.text + "8"

                        }
            }

            MouseArea {
                id: mouseAreaDigit18
                x: 237
                y: 171
                width: 97
                height: 67
                onClicked: {
                            textFieldDCNumber.text = textFieldDCNumber.text + "9"

                        }
            }

            MouseArea {
                id: mouseAreaDigit19
                x: 119
                y: 249
                width: 97
                height: 67
                onClicked: {
                            textFieldDCNumber.text = textFieldDCNumber.text + "0"

                        }
            }

            Rectangle {
                id: rectangleCancel1
                x: 0
                y: 249
                width: 97
                height: 67
                color: "#fd3a3a"
                radius: 15
                Image {
                    id: imageCancel1
                    x: 0
                    y: 0
                    width: 97
                    height: 67
                    source: "Images/Cancel.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                id: rectangleConfirm1
                x: 237
                y: 249
                width: 97
                height: 67
                color: "#63f517"
                radius: 15
                Image {
                    id: imageConfirmDCNumber
                    x: 0
                    y: 8
                    width: 97
                    height: 51
                    source: "Images/Confirm.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            MouseArea {
                id: mouseAreaConfirmDCNumber
                x: 238
                y: 249
                width: 96
                height: 67
                onClicked: {
                            if(textFieldDCNumber.text === "1234"){
                                groupBoxDCNumberKeypad.visible = false
                                groupBoxDCNumber.visible = false
                                groupBoxSRL.visible = true
                            }
                        }
            }
        }
    }
    Connections{
        target: backend
        function onSetName(name){
            labelWelcomeUser.text = name
            labelWelcomeUser.visible = true
        }

    }

}







/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:64}D{i:74}
}
##^##*/
