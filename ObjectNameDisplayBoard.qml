import QtQuick 2.0

Text {
    anchors.centerIn: parent
    objectName: "objectNameDisplayBoard"
    font.pixelSize: 32
    color: "white"
    height: 10
    text: ""
    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.paintedHeight
        width: parent.paintedWidth === 0 ? 0 : parent.paintedWidth + 16
        color: "black"
        border.width: 1
        border.color: "orange"
        opacity: 0.4
        z: -1
    }
}
