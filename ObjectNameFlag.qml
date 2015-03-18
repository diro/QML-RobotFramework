import QtQuick 2.0

Item {
    id: base
    property var item
    property var displayBoard
    property string labelName: ""
    property string labelPath: ""
    anchors.fill: parent

    Rectangle {
        id: itemBorder
        anchors.fill: parent
        border.width: 1
        border.color: "transparent"
        color: "transparent"
        radius: 2
        Rectangle {
            id: rectLabelFlag
            anchors.top: parent.top
            anchors.left: parent.left
            width: 10
            height: 10
            color: "red"
            radius: 2

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    itemBorder.border.color = "red"
                    displayBoard.labelName = base.labelName
                    displayBoard.labelPath = base.labelPath

                }
                onExited: {
                    itemBorder.border.color = "transparent"
                    displayBoard.labelName = ""
                    displayBoard.labelPath = ""
                    rectLabelFlag.color = "red"
                    
                }
                onClicked: {
                    displayBoard.copyToClipBoard()
                    rectLabelFlag.color = "green"
                }
            }
        }
    }
}
