import QtQuick 2.0
import QtQuick.Controls 1.3

Text {
    id: base
    property string labelPath: ""
    property string labelName: ""
    anchors.centerIn: parent
    objectName: "objectNameDisplayBoard"
    font.pixelSize: 24
    font.family: "Verdana"
    color: "white"
    height: 10
    text: labelPath + labelName

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

    TextInput {
        id: objtext
        text: base.labelName
        visible: false
    }
    function copyToClipBoard() {
        objtext.selectAll()
        objtext.copy()
    }
}
