import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import "utils.js" as Utils

Item {
    id: root

    property int boxCount
    property string currentColor
    property string name: "Info"

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 10

        Label {
            Layout.alignment: Qt.AlignHCenter

            text: "User choices"
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            Label {
                anchors.centerIn: parent
                text: Utils.boxCountInfoText(boxCount) + "\n" + Utils.currentColorInfoText(currentColor)
            }
        }
    }
}
