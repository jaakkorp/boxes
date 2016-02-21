import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import "utils.js" as Utils

Item {
    id: root

    property string currentColor: chosenColor.color
    property string name: "Color Picker"

    function setColor(color) {
        chosenColor.color = color
    }

    ColumnLayout {
        spacing: 10
        anchors.fill: parent
        anchors.topMargin: 10

        Row {
            id: buttonsRow

            spacing: 5
            Layout.alignment: Qt.AlignHCenter

            Button {
                text: "Blue"
                onClicked: { chosenColor.color = "#0000ff" }
            }

            Button {
                text: "Green"
                onClicked: { chosenColor.color = "#008000" }
            }

            Button {
                text: "Red"
                onClicked: { chosenColor.color = "#ff0000" }
            }

            Button {
                text: "Yellow"
                onClicked: { chosenColor.color = "#ffff00" }
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                id: chosenColor
                anchors.centerIn: parent
                height: 0.3 * root.height
                width: 0.7 * root.width
                color: "#0000ff"
                radius: 10
            }
        }

        Text {
            id: info
            Layout.alignment: Qt.AlignHCenter
            text: Utils.currentColorInfoText(currentColor)
        }
    }
}
