import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    Sidebar {
        id: sidebar
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
            right: calendar.left
            margins: 25
        }
    }

    Calendar {
        id: calendar
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
            margins: 25
        }
        width: parent.width / 1.6
        locale: Qt.locale("ru_RU")
        weekNumbersVisible: true
        onClicked: {
            sidebar.parseDate(date.toLocaleDateString(Qt.locale("ru_RU"), Locale.LongFormat))
            sidebar.noteList = notes.getNotes(date)
        }
    }
}
