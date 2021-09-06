import QtQuick 2.0

Rectangle {
    id: sideRect
    color: 'blue'
    opacity: 0.5
    property var noteList: []
    property int textSize: ((row.width + row.height) / 13) + 5

    function parseDate(date){
        let fullDateArray = date.split(',')
        let dateArray = fullDateArray[1].split(' ')
        dayNum.text = dateArray[1]
        dayText.text = fullDateArray[0]
        month.text = dateArray[2] + ', ' + dateArray[3]
    }

    Rectangle {
        id: header
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        height: parent.height / 8

        Row {
            id: row
            anchors.fill: parent
            anchors.leftMargin: 2
            spacing: 5
            Text {
                id: dayNum
                font.pixelSize: parent.height - 10
            }
            Column {
                spacing: row.height / 8
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    id: dayText
                    font.pixelSize: textSize / 1.5
                }
                Text {
                    id: month
                    font.pixelSize: textSize / 1.7
                }
            }
        }
    }

    ListView {
        anchors {
            top: header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            topMargin: 10
        }
        model: noteList
        delegate: noteDelegate
        spacing: 10
        clip: true
    }

    Component {
        id: noteDelegate
        Rectangle {
           height: (nameText.font.pixelSize + timeText.font.pixelSize) + 20
           width: sideRect.width
           Image {
                id: image
                source: 'qrc:/img/bar.png'
                anchors {
                    top: parent.top
                    left: parent.left
                    topMargin: 6
                    leftMargin: 5
                }
                width: textSize
                height: textSize
           }
           Text {
               id: nameText
               text: modelData.name
               font.pixelSize: textSize
               anchors {
                   left: image.right
                   right: parent.right
                   top: parent.top
                   leftMargin: 7
                   topMargin: 2
               }
           }
           Text {
               id: timeText
               text: modelData.time.toLocaleTimeString(Qt.locale('ru_RU'), Locale.ShortFormat)
               font.pixelSize: textSize
               anchors {
                   left: image.right
                   right: parent.right
                   top: nameText.bottom
                   bottom: parent.bottom
                   leftMargin: 7
                   topMargin: 2
               }
           }
       }
    }
}
