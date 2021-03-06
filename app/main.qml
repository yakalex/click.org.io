import QtQuick 2.12
import QtQuick.Controls 2.5



ApplicationWindow {
    id: window
    visible: true
    property int swidth: 1080
    property int sheight: 1920
    width: swidth
    height: sheight 
    Connections {
            target: appCore
            onSendResolution: {
                swidth = width
                sheight = height
            }
    }

    //title: qsTr("Stack")



    header: ToolBar {
        contentHeight: toolButton.implicitHeight

        ToolButton {
            id: toolButton
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Start")
                width: parent.width
                onClicked: {
                    stackView.push("StartForm.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Final")
                width: parent.width
                onClicked: {
                    stackView.push("FinalForm.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Loading")
                width: parent.width
                onClicked: {
                    stackView.push("LoadingForm.ui.qml")
                    drawer.close()
                }
            }
            ItemDelegate {
                text: qsTr("Home")
                width: parent.width
                onClicked: {
                    stackView.push("HomeForm.ui.qml")
                    drawer.close()
                }
            }
        }
    }


    StackView {
        id: stackView
        initialItem: "StartForm.ui.qml"
        anchors.fill: parent
    }
}
