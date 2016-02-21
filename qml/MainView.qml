import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import QtQml.Models 2.2

Item {
    id: root

    property int contentHeight: content.height
    property int contentWidth: content.width
    default property alias content: objectModel.children

    ColumnLayout {
        anchors.fill: parent

        ListView {
            id: tabs

            height: 50
            Layout.fillWidth: true

            interactive: false
            orientation: Qt.Horizontal

            currentIndex: internal.currentIndex
            onCurrentIndexChanged: internal.currentIndex = currentIndex

            model: objectModel.children

            delegate: Item {
                id: delegate

                height: parent.height
                width: root.width / objectModel.count;

                Rectangle {
                    anchors.fill: parent
                    color: "#60ffffff"
                    border.color: "#000000"

                    MouseArea {
                        anchors.fill: parent
                        onClicked: internal.currentIndex = index
                    }

                    Label {
                        anchors.centerIn: parent
                        text: objectModel.children[index].name
                        font.bold: index === internal.currentIndex
                    }
                }
            }
        }

        ListView {
            id: content

            Layout.fillHeight: true
            Layout.fillWidth: true

            currentIndex: internal.currentIndex
            onCurrentIndexChanged: internal.currentIndex = currentIndex

            orientation: Qt.Horizontal
            boundsBehavior: Flickable.StopAtBounds
            model: ObjectModel { id: objectModel }

            highlightRangeMode: ListView.StrictlyEnforceRange
            snapMode: ListView.SnapOneItem
        }
    }

    QtObject {
        id: internal

        property int currentIndex: 0
    }
}
