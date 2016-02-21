import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import "qml"
import "qml/utils.js" as Utils

ApplicationWindow {
    id: root

    title: "Exercise"

    height: 640
    width: 420
    minimumHeight: height
    minimumWidth: width
    maximumHeight: height
    maximumWidth: width

    menuBar: MenuBar {
        Menu {
            title: "File"
            MenuItem {
                text: "Close"
                shortcut: StandardKey.Quit
                onTriggered: close()
            }
        }
    }

    Component.onCompleted: {
        visibility = Window.Windowed
        internal.loadFromSettings()
    }

    onClosing: internal.save()

    MainView {
        id:view

        anchors.fill: parent

        Boxes {
            id: boxes

            width: view.contentWidth
            height: view.contentHeight
            currentColor: colorPicker.currentColor
        }

        ColorPicker {
            id: colorPicker

            width: view.contentWidth
            height: view.contentHeight
        }

        Info {
            width: view.contentWidth
            height: view.contentHeight
            boxCount: boxes.boxCount
            currentColor: colorPicker.currentColor
        }
    }

    QtObject {
        id: internal

        function save() {
            Settings.setValue(Utils.KCurrentColor, colorPicker.currentColor)
            Settings.setVariantList(Utils.KData, boxes.modelData())
        }

        function loadFromSettings() {
            if (Settings.contains(Utils.KCurrentColor))
                colorPicker.setColor(Settings.value(Utils.KCurrentColor))

            if (Settings.contains(Utils.KData))
                boxes.setModelData(Settings.value(Utils.KData))
        }

    }
}
