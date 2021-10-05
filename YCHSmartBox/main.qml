import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.10
import QtQml 2.10


Window {
    visible: true
    width: 1280
    height: 800
    title: qsTr("YCH SmartBox")
    color: "#ffffff"

    Rectangle {
        id: rectUI
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        color: "#433d3d"
        gradient: Gradient{
            GradientStop{ position: 1.0; color: "#F1bc09"}
            GradientStop{ position: 0.5; color: "#F1d109"}
            GradientStop{ position: 0.0; color: "#eaf109"}

        }

        Image {
            id: ychLogo
            x: 560
            y: -22
            width: 160
            height: 133
            fillMode: Image.PreserveAspectFit
            source: "Images/YCHLogo.png"
        }
        Text {
            id: textSelectActivity
            x: 41
            y: 32
            width: 291
            height: 50
            text: qsTr("Select Activity")
            font.bold: true
            font.pixelSize: 40
        }
        Rectangle {
            id: rectangleOptions
            x: 36
            y: 88
            width: 302
            height: 230
            color: "#e1dea0"
            radius: 15
            border.width: 1

            RadioButton {
                id: radioButtonPickMaterial
                x: 11
                y: 31
                width: 278
                height: 44
                text: qsTr("Pick Material")
                font.pixelSize: 25
                font.bold: true
                onToggled: {
                    groupBoxSOID.visible = true
                    groupBoxSOIDKeypad.visible = false
                    groupBoxDCNumber.visible = false
                    groupBoxDCNumberKeypad.visible = false
                    groupBoxSRL.visible = false
                    groupBoxSRLKeypad.visible = false
                    groupBoxOTP.visible = false
                    groupBoxOTPKeypad.visible = false
                }
            }

            RadioButton {
                id: radioButtonRefillMaterial
                x: 8
                y: 93
                width: 286
                height: 44
                text: qsTr("Refill Material")
                font.pixelSize: 25
                font.bold: true
                onToggled: {
                    groupBoxSOID.visible = false
                    groupBoxSOIDKeypad.visible = false
                    groupBoxSRLKeypad.visible = false
                    groupBoxSRL.visible = false
                    groupBoxDCNumber.visible = true
                    textFieldDCNumber.text = ""
                    textFieldSRL.text =""
                    textFieldSOID.text = ""
                }
            }

            RadioButton {
                id: radioButtonRefillMaterial1
                x: 8
                y: 152
                width: 286
                height: 44
                text: qsTr("Master Settings")
                font.pixelSize: 25
                font.bold: true
            }
        }

        GroupBox {
            id: groupBoxSOID
            x: 422
            y: 81
            width: 484
            height: 170
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
                y: 34
                width: 312
                height: 46
                font.pointSize: 18
                font.bold: true
                placeholderText: "Enter SOID"
            }

            Rectangle {
                id: rectForceQuitSOID
                x: 318
                y: 23
                width: 148
                height: 69
                color: "#eaeae6"
                radius: 15

                Image {
                    id: imageForceQuitSOID
                    x: -14
                    y: -6
                    width: 166
                    height: 56
                    source: "Images/Cancel.png"
                    fillMode: Image.PreserveAspectFit

                    Text {
                        id: textForceQuitSOID
                        x: 41
                        y: 46
                        text: qsTr("Force Quit")
                        font.pixelSize: 20
                        font.bold: true
                    }

                    MouseArea {
                        id: mouseAreaForceQuitSOID
                        x: 15
                        y: 7
                        width: 143
                        height: 67
                        onClicked: {
                            textFieldSOID.text = ""
                            groupBoxSOID.visible = true
                            groupBoxSOIDKeypad.visible = false
                            groupBoxDCNumber.visible = false
                            groupBoxDCNumberKeypad.visible = false
                            groupBoxOTP.visible = false
                            groupBoxOTPKeypad.visible = false
                        }
                    }
                }
            }

            Rectangle {
                id: rectSOIDKeypad
                x: 0
                y: 100
                width: 138
                height: 46
                color: "#433d3d"
                radius: 15

                Text {
                    id: textSOIDKeypad
                    x: 23
                    y: 6
                    width: 90
                    height: 30
                    color: "#f7f6f6"
                    text: qsTr("Keypad")
                    font.pixelSize: 25
                    font.bold: true
                }

                MouseArea {
                    id: mouseAreaSOIDKeypad
                    x: 0
                    y: 0
                    width: 138
                    height: 46
                    onClicked: {
                        groupBoxSOIDKeypad.visible = !groupBoxSOIDKeypad.visible
                    }
                }
            }

            Rectangle {
                id: rectSOIDConfirm
                x: 155
                y: 102
                width: 138
                height: 46
                color: "#40433d"
                radius: 15
                Text {
                    id: textSOIDConfirm
                    x: 23
                    y: 6
                    width: 90
                    height: 30
                    color: "#f7f6f6"
                    text: qsTr("Confirm")
                    font.pixelSize: 25
                    font.bold: true
                }

                MouseArea {
                    id: mouseAreaConfirmSOID1
                    x: 0
                    y: 2
                    width: 138
                    height: 46
                    onClicked: {
                            backend.soidChecker(textFieldSOID.text)
                    }
                }
            }

        }


        Label {
            id: labelWelcomeUser
            x: 82
            y: 333
            width: 211
            height: 111
            visible: true
            font.bold: true
            font.pixelSize: 22


        }

        GroupBox {
            id: groupBoxSRLKeypad
            x: 485
            y: 283
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
                id: mouseAreaConfirmSRL
                x: 238
                y: 249
                width: 96
                height: 67
                onClicked:{
                    backend.srlLockOpen(textFieldSRL.text)
                }
            }

        }

        MouseArea {
            id: mouseAreaCancelSRL
            x: 468
            y: 537
            width: 97
            height: 64
            onClicked: {
                textFieldSRL.text = ""

            }
        }


        GroupBox {
            id: groupBoxDCNumberKeypad
            x: 485
            y: 283
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
                    id: imageCancelDCNumber
                    x: 0
                    y: 0
                    width: 97
                    height: 67
                    source: "Images/Cancel.png"
                    fillMode: Image.PreserveAspectFit

                    MouseArea {
                        id: mouseAreaCancelDCNumber
                        x: 0
                        y: 0
                        width: 97
                        height: 67
                        onClicked: {
                            textFieldDCNumber.text = ""
                        }
                    }
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
                    backend.dcNumberChecker(textFieldDCNumber.text)
                }
            }
        }

        GroupBox {
            id: groupBoxSOIDKeypad
            x: 488
            y: 282
            width: 362
            height: 328
            visible: false
            Rectangle {
                id: rectKey20
                x: 0
                y: 7
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text20
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
                id: mouseAreaDigit20
                x: 0
                y: 7
                width: 97
                height: 67
                onClicked: {
                            textFieldSOID.text = textFieldSOID.text + "1"

                        }
            }

            Rectangle {
                id: rectKey21
                x: 119
                y: 7
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text21
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
                id: rectKey22
                x: 237
                y: 7
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text22
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
                id: rectKey23
                x: 0
                y: 86
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text23
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
                id: rectKey24
                x: 119
                y: 86
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text24
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
                id: rectKey25
                x: 237
                y: 86
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text25
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
                id: rectKey26
                x: 0
                y: 171
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text26
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
                id: rectKey27
                x: 119
                y: 171
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text27
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
                id: rectKey28
                x: 237
                y: 171
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text28
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
                id: rectKey29
                x: 119
                y: 249
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text29
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
                id: mouseAreaDigit21
                x: 119
                y: 7
                width: 97
                height: 67
                onClicked: {
                    textFieldSOID.text = textFieldSOID.text + "2"

                }
            }

            MouseArea {
                id: mouseAreaDigit22
                x: 237
                y: 7
                width: 97
                height: 67
                onClicked: {
                    textFieldSOID.text = textFieldSOID.text + "3"

                }
            }

            MouseArea {
                id: mouseAreaDigit23
                x: 0
                y: 86
                width: 97
                height: 67
                onClicked: {
                    textFieldSOID.text = textFieldSOID.text + "4"

                }
            }

            MouseArea {
                id: mouseAreaDigit24
                x: 119
                y: 86
                width: 97
                height: 67
                onClicked: {
                    textFieldSOID.text = textFieldSOID.text + "5"

                }
            }

            MouseArea {
                id: mouseAreaDigit25
                x: 237
                y: 86
                width: 97
                height: 67
                onClicked: {
                    textFieldSOID.text = textFieldSOID.text + "6"

                }
            }

            MouseArea {
                id: mouseAreaDigit26
                x: 0
                y: 171
                width: 97
                height: 67
                onClicked: {
                    textFieldSOID.text = textFieldSOID.text + "7"

                }
            }

            MouseArea {
                id: mouseAreaDigit27
                x: 119
                y: 171
                width: 97
                height: 67
                onClicked: {
                    textFieldSOID.text = textFieldSOID.text + "8"

                }
            }

            MouseArea {
                id: mouseAreaDigit28
                x: 237
                y: 171
                width: 97
                height: 67
                onClicked: {
                    textFieldSOID.text = textFieldSOID.text + "9"

                }
            }

            MouseArea {
                id: mouseAreaDigit29
                x: 119
                y: 249
                width: 97
                height: 67
                onClicked: {
                    textFieldSOID.text = textFieldSOID.text + "0"

                }
            }

            Rectangle {
                id: rectangleCancelSOID
                x: 0
                y: 249
                width: 97
                height: 67
                color: "#fd3a3a"
                radius: 15
                Image {
                    id: imageCancelSOID
                    x: 0
                    y: 0
                    width: 97
                    height: 67
                    source: "Images/Cancel.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                id: rectangleConfirmSOID
                x: 237
                y: 249
                width: 97
                height: 67
                color: "#63f517"
                radius: 15
                Image {
                    id: image1
                    x: 0
                    y: 8
                    width: 97
                    height: 51
                    source: "Images/Confirm.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            MouseArea {
                id: mouseAreaConfirmSOID
                x: 238
                y: 249
                width: 96
                height: 67
                onClicked: {
                        backend.soidChecker(textFieldSOID.text)
                }
            }

            MouseArea {
                id: mouseAreaCancelSOID
                x: 0
                y: 249
                width: 97
                height: 67
                onClicked:{
                    textFieldSOID.text = ""
                }
            }
        }

        GroupBox {
            id: groupBoxOTP
            x: 432
            y: 82
            width: 484
            height: 170
            visible: false
            Text {
                id: textEnterOTP
                x: 0
                y: -6
                text: qsTr("Enter OTP")
                font.pixelSize: 25
                font.bold: true
            }

            TextField {
                id: textFieldOTP
                x: 1
                y: 34
                width: 307
                height: 46
                placeholderText: "Enter OTP"
                font.bold: true
                font.pointSize: 18
            }

            Rectangle {
                id: rectForceQuitOTP
                x: 324
                y: 25
                width: 148
                height: 69
                color: "#eaeae6"
                radius: 15
                Image {
                    id: imageForceQuitOTP
                    x: -9
                    y: -6
                    width: 166
                    height: 56
                    source: "Images/Cancel.png"
                    fillMode: Image.PreserveAspectFit
                    Text {
                        id: textForceQuitOTP
                        x: 33
                        y: 48
                        text: qsTr("Force Quit")
                        font.pixelSize: 20
                        font.bold: true
                    }

                    MouseArea {
                        id: mouseAreaForceQuitOTP
                        x: 12
                        y: 8
                        width: 143
                        height: 67
                        onClicked: {
                            textFieldOTP.text = ""
                            textFieldSOID.text = ""
                            groupBoxOTP.visible = false
                            groupBoxOTPKeypad.visible = false
                            groupBoxSOIDKeypad.visible = false
                            groupBoxSOID.visible = true
                        }
                    }
                }
            }

            Rectangle {
                id: rectOTPKeypad
                x: 1
                y: 100
                width: 138
                height: 46
                color: "#433d3d"
                radius: 15
                Text {
                    id: textOTPKeypad
                    x: 23
                    y: 6
                    width: 90
                    height: 30
                    color: "#f7f6f6"
                    text: qsTr("Keypad")
                    font.pixelSize: 25
                    font.bold: true
                }

                MouseArea {
                    id: mouseAreaOTPKeypad
                    x: 0
                    y: 0
                    width: 138
                    height: 46
                    onClicked: {
                        groupBoxOTPKeypad.visible = !groupBoxOTPKeypad.visible
                    }
                }
            }

            Rectangle {
                id: rectOTPConfirm1
                x: 158
                y: 100
                width: 138
                height: 46
                color: "#433d3d"
                radius: 15
                Text {
                    id: textOTPConfirm
                    x: 24
                    y: 7
                    width: 90
                    height: 30
                    color: "#f7f6f6"
                    text: qsTr("Confirm")
                    font.pixelSize: 25
                    font.bold: true
                }

                MouseArea {
                    id: mouseAreaConfirmOTP1
                    x: 0
                    y: 0
                    width: 138
                    height: 46
                    onClicked: {
                        backend.otpChecker(textFieldOTP.text)
                    }
                }
            }
        }

        GroupBox {
            id: groupBoxDCNumber
            x: 424
            y: 81
            width: 484
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
                y: 36
                width: 295
                height: 46
                font.pointSize: 18
                placeholderText: "Enter DC Number"
                font.bold: true
            }

            Rectangle {
                id: rectImageDCNumber
                x: 307
                y: 25
                width: 147
                height: 69
                color: "#eaeae6"
                radius: 15
                Image {
                    id: imageDCNumber
                    x: 24
                    y: -7
                    width: 102
                    height: 60
                    source: "Images/Cancel.png"
                    fillMode: Image.PreserveAspectFit
                    MouseArea {
                        id: mouseAreaForceQuitDCNumber
                        x: -27
                        y: 10
                        width: 161
                        height: 64
                        onClicked: {
                            //Qt.quit()
                            textFieldDCNumber.text = ""
                            textFieldSRL.text = ""
                            groupBoxDCNumberKeypad.visible = false
                            groupBoxSRLKeypad.visible = false
                            groupBoxSRL.visible = false
                            groupBoxDCNumber.visible = true
                        }
                    }

                    Text {
                        id: textForceQuitDCNumber
                        x: -3
                        y: 46
                        text: qsTr("Force Quit")
                        font.pixelSize: 21
                        font.bold: true
                    }
                }
            }

            Rectangle {
                id: rectDCNumberKeypad
                x: 2
                y: 97
                width: 141
                height: 49
                color: "#433d3d"
                radius: 15
                Text {
                    id: textDCNumberKeypad
                    x: 24
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
                    x: 0
                    y: 0
                    width: 129
                    height: 49
                    onClicked: {
                        groupBoxDCNumberKeypad.visible = true
                    }
                }
            }

            Rectangle {
                id: rectDCNumberConfirm1
                x: 154
                y: 97
                width: 141
                height: 49
                color: "#433d3d"
                radius: 15
                MouseArea {
                    id: mouseAreaDCNumberKeypad1
                    x: -152
                    y: 0
                    width: 137
                    height: 49
                    onClicked: {
                        groupBoxDCNumberKeypad.visible = !groupBoxDCNumberKeypad.visible
                    }
                }

                Text {
                    id: textDCNumberConfirm
                    x: 24
                    y: 8
                    width: 91
                    height: 33
                    color: "#f1efef"
                    text: qsTr("Confirm")
                    font.pixelSize: 25
                    font.bold: true
                }


                MouseArea {
                    id: mouseAreaConfirmDCNumber1
                    x: 0
                    y: 0
                    width: 141
                    height: 49
                    onClicked: {
                        backend.dcNumberChecker(textFieldDCNumber.text)
                    }
                }
            }
        }

        GroupBox {
            id: groupBoxOTPKeypad
            x: 487
            y: 282
            width: 362
            height: 328
            visible: false
            Rectangle {
                id: rectKey30
                x: 0
                y: 7
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text30
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
                id: mouseAreaDigit30
                x: 0
                y: 7
                width: 97
                height: 67
                onClicked: {
                                    textFieldOTP.text = textFieldOTP.text + "1"

                                }
            }

            Rectangle {
                id: rectKey31
                x: 119
                y: 7
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text31
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
                id: rectKey32
                x: 237
                y: 7
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text32
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
                id: rectKey33
                x: 0
                y: 86
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text33
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
                id: rectKey34
                x: 119
                y: 86
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text34
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
                id: rectKey35
                x: 237
                y: 86
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text35
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
                id: rectKey36
                x: 0
                y: 171
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text36
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
                id: rectKey37
                x: 119
                y: 171
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text37
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
                id: rectKey38
                x: 237
                y: 171
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text38
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
                id: rectKey39
                x: 119
                y: 249
                width: 97
                height: 67
                color: "#433d3d"
                radius: 15
                border.width: 0
                Text {
                    id: text39
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
                id: mouseAreaDigit31
                x: 119
                y: 7
                width: 97
                height: 67
                onClicked: {
                                    textFieldOTP.text = textFieldOTP.text + "2"

                                }
            }

            MouseArea {
                id: mouseAreaDigit32
                x: 237
                y: 7
                width: 97
                height: 67
                onClicked: {
                                    textFieldOTP.text = textFieldOTP.text + "3"

                                }
            }

            MouseArea {
                id: mouseAreaDigit33
                x: 0
                y: 86
                width: 97
                height: 67
                onClicked: {
                                    textFieldOTP.text = textFieldOTP.text + "4"

                                }
            }

            MouseArea {
                id: mouseAreaDigit34
                x: 119
                y: 86
                width: 97
                height: 67
                onClicked: {
                                    textFieldOTP.text = textFieldOTP.text + "5"

                                }
            }

            MouseArea {
                id: mouseAreaDigit35
                x: 237
                y: 86
                width: 97
                height: 67
                onClicked: {
                            textFieldOTP.text = textFieldOTP.text + "6"

                        }
            }

            MouseArea {
                id: mouseAreaDigit36
                x: 0
                y: 171
                width: 97
                height: 67
                onClicked: {
                            textFieldOTP.text = textFieldOTP.text + "7"

                        }
            }

            MouseArea {
                id: mouseAreaDigit37
                x: 119
                y: 171
                width: 97
                height: 67
                onClicked: {
                            textFieldOTP.text = textFieldOTP.text + "8"

                        }
            }

            MouseArea {
                id: mouseAreaDigit38
                x: 237
                y: 171
                width: 97
                height: 67
                onClicked: {
                            textFieldOTP.text = textFieldOTP.text + "9"

                        }
            }

            MouseArea {
                id: mouseAreaDigit39
                x: 119
                y: 249
                width: 97
                height: 67
                onClicked: {
                            textFieldOTP.text = textFieldOTP.text + "0"

                        }
            }

            Rectangle {
                id: rectangleCancelOTP
                x: 0
                y: 249
                width: 97
                height: 67
                color: "#fd3a3a"
                radius: 15
                Image {
                    id: imageCancelOTP
                    x: 0
                    y: 0
                    width: 97
                    height: 67
                    source: "Images/Cancel.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            Rectangle {
                id: rectangleConfirmOTP
                x: 237
                y: 249
                width: 97
                height: 67
                color: "#63f517"
                radius: 15
                Image {
                    id: image2
                    x: 0
                    y: 8
                    width: 97
                    height: 51
                    source: "Images/Confirm.png"
                    fillMode: Image.PreserveAspectFit
                }
            }

            MouseArea {
                id: mouseAreaConfirmOTP
                x: 238
                y: 249
                width: 96
                height: 67
                onClicked: {
                    backend.otpChecker(textFieldOTP.text)
                }
            }

            MouseArea {
                id: mouseAreaCancelOTP
                x: 0
                y: 249
                width: 97
                height: 67
                onClicked: {
                            textFieldOTP.text = ""
                        }
            }
        }
        GroupBox {
            id: groupBoxSRL
            x: 427
            y: 82
            width: 484
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
                y: 37
                width: 293
                height: 46
                font.pointSize: 18
                placeholderText: "Enter SRL"
                font.bold: true

            }

            Rectangle {
                id: rectImageRefMat
                x: 306
                y: 25
                width: 166
                height: 69
                color: "#eaeae6"
                radius: 15

                Text {
                    id: textForceQuitSRL
                    x: 35
                    y: 41
                    text: qsTr("Force Quit")
                    font.pixelSize: 21
                    font.bold: true
                }
                Image {
                    id: imageSRLForceQuit
                    x: 22
                    y: -6
                    width: 126
                    height: 61
                    source: "Images/Cancel.png"
                    fillMode: Image.PreserveAspectFit

                    MouseArea {
                        id: mouseAreaForceQuitSRL
                        x: -23
                        y: 7
                        width: 158
                        height: 68
                        onClicked: {
                            //Qt.quit()
                            textFieldDCNumber.text = ""
                            textFieldSRL.text = ""
                            groupBoxDCNumberKeypad.visible = false
                            groupBoxSRLKeypad.visible = false
                            groupBoxSRL.visible = false
                            groupBoxDCNumber.visible = true
                        }
                    }
                }
            }

            Rectangle {
                id: rectSRLKeypad
                x: 0
                y: 97
                width: 139
                height: 49
                color: "#433d3d"
                radius: 15

                Text {
                    id: textSRLKeypad
                    x: 26
                    y: 7
                    width: 91
                    height: 33
                    color: "#f1efef"
                    text: qsTr("Keypad")
                    font.pixelSize: 25
                    font.bold: true
                }

                MouseArea {
                    id: mouseAreaSRLKeypad
                    x: 2
                    y: 0
                    width: 137
                    height: 49
                    onClicked: {
                        groupBoxSRLKeypad.visible = !groupBoxSRLKeypad.visible
                    }
                }
            }

            Rectangle {
                id: rectSRLConfirm1
                x: 154
                y: 97
                width: 145
                height: 49
                color: "#433d3d"
                radius: 15
                Text {
                    id: textSRLConfirm1
                    x: 23
                    y: 8
                    width: 91
                    height: 33
                    color: "#f1efef"
                    text: qsTr("Confirm")
                    font.pixelSize: 25
                    font.bold: true
                }
            }

            MouseArea {
                id: mouseAreaSRLConfirm1
                x: 154
                y: 97
                width: 146
                height: 49
                onClicked: {
                    backend.srlLockOpen(textFieldSRL.text)
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
        function onOtpResult(result){
            if(result === "True"){
                groupBoxOTP.visible = false
                groupBoxOTPKeypad.visible = false
        }
     }

        function onSoidResult(result){
            if(result === "True"){
                groupBoxOTP.visible = true
                groupBoxSOID.visible = false
                groupBoxSOIDKeypad.visible = false
            }
        }
        function onDcNumberResult(result){
            if(result === "True"){
                groupBoxDCNumber.visible = false
                groupBoxDCNumberKeypad.visible = false
                groupBoxSRL.visible = true
            }
        }

    }

}





/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:11}
}
##^##*/
