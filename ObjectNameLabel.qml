import QtQuick 2.0

Rectangle {
    property alias text:objectName.text
    height: 28
    anchors.horizontalCenter:parent.horizontalCenter
    y:parent.border.width
    width: parent.width - 2
    color:"#333322"
    opacity:0.9
    Text {
        id:objectName
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top:parent.top
        anchors.topMargin: 3
        font.pixelSize:18
        font.family: "Verdana"
        color: "#e6f3cf"
        width: base.width
    }
}

