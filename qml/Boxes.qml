import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2
import "utils.js" as Utils

Item {
    id: root

    readonly property alias boxCount: boxesModel.count
    property string currentColor
    property string name: "Boxes"

    function modelData() {
        var array = new Array(boxesModel.count)

        for (var i = 0; i < array.length; ++i)
            array[i] = boxesModel.get(i).boxColor

        return array
    }

    function setModelData(array) {
        if (!array)
            return

        boxesModel.clear()

        for (var i = 0; i < array.length; ++i)
            boxesModel.append( {"boxColor": array[i]} )
    }

    onCurrentColorChanged: internal.changeBoxColor()

    ColumnLayout {
        spacing: 10
        anchors.fill: parent
        anchors.topMargin: 10

        Row {
            id: buttonsRow

            spacing: 5
            Layout.alignment: Qt.AlignHCenter
            add: addTransition

            Button {
                text: "Add"
                onClicked: internal.addBox()
            }

            Button {
                text: "Remove"
                enabled: boxesModel.count > 0
                onClicked: internal.removeBox()
            }
        }

        GridView {
            id: boxGrid

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.minimumHeight: 30
            Layout.alignment: Qt.AlignHCenter

            add: addTransition
            remove: removeTransition
            removeDisplaced: moveTransition

            cellHeight: cellWidth / 2
            cellWidth: root.width / 2

            currentIndex: -1
            highlight: highlight
            highlightMoveDuration: currentIndex === -1 ? 0 : 150
            clip: true
            snapMode: GridView.SnapToRow

            model: boxesModel

            delegate: Item {
                id: item

                height: boxGrid.cellHeight
                width: boxGrid.cellWidth

                Rectangle {
                    id: box

                    anchors.centerIn: parent
                    color: boxColor
                    border.color: "#000000"
                    border.width: 5
                    radius: 10
                    height: 0.8 * parent.height
                    width: 0.8 * parent.width

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (boxGrid.currentIndex === index) {
                                boxGrid.currentIndex = -1
                            } else {
                                boxGrid.currentIndex = index
                            }
                        }
                    }
                }
            }
        }

        Text {
            id: info

            Layout.alignment: Qt.AlignHCenter
            text: Utils.boxCountInfoText(boxCount)
        }
    }

    Component {
        id: highlight

        Rectangle {
            color: "#b0c4de"
            border.color: "#0000ff"
            border.width: 5
            radius: 10
        }
    }

    ListModel {
        id: boxesModel
    }

    Transition {
        id: addTransition

        NumberAnimation { properties: "opacity, scale"; from: 0.0; to: 1.0; duration: 500 }
    }

    Transition {
        id: moveTransition

        NumberAnimation { properties: "x,y"; easing.type: Easing.OutCirc; duration: 500 }
    }

    Transition {
        id: removeTransition

        NumberAnimation { properties: "opacity, scale"; from: 1.0; to: 0.0; duration: 500 }
    }

    QtObject {
        id: internal

        function addBox() {
            boxesModel.append( {"boxColor": root.currentColor} )
        }

        function removeBox() {
            if (boxesModel.count === 1)
                boxGrid.currentIndex = -1

            if (boxGrid.currentIndex !== -1) {
                boxesModel.remove(boxGrid.currentIndex, 1)
            } else {
                boxesModel.remove(boxesModel.count - 1, 1)
            }
        }

        function changeBoxColor() {
            if (boxGrid.currentIndex !== -1) {
                if (boxesModel.get(boxGrid.currentIndex).boxColor !== root.currentColor)
                    boxesModel.get(boxGrid.currentIndex).boxColor = root.currentColor
            }
        }
    }
}
