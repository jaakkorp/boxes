import QtQuick 2.0
import Qt.labs.sortboxmodel 1.0
import QtQuick.Controls 1.0
import QtQuick.Window 2.1
import QtQuick.Layouts 1.0

Item {
    property int boxCount
    property string currentColor

    Component.onCompleted: {
        boxCount = 0
        currentColor = "red"
    }
}
