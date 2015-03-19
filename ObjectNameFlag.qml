import QtQuick 2.0

import "ItemMemberBlackList.js" as BlackList

Item {
    id: base
    property var item
    property var displayBoard
    property int flagSize: 10
    property string labelName: ""
    property string labelPath: ""
    anchors.fill: parent

    ListModel {
        id: propList
    }

    ListModel {
        id: funcList
    }

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
            width: base.flagSize
            height: base.flagSize
            color: "#ff0000"
            radius: 2

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onEntered: {
                    itemBorder.border.color = "red"
                }
                onExited: {
                    itemBorder.border.color = "transparent"
                    displayBoard.delayHide()
                }
                onClicked: {
                    adjustPanelPosition(displayBoard, base.flagSize,
                                        base.flagSize)
                    generateItemMetadataModel()
                    displayBoard.labelName = base.labelName
                    displayBoard.labelPath = base.labelPath
                    displayBoard.funcModel = funcList
                    displayBoard.propModel = propList

                    displayBoard.show()
                    displayBoard.copyToClipBoard()
                }
            }
        }
    }

    Component.onCompleted: {
        BlackList.init()
    }

    function adjustPanelPosition(panel, blockWidth, blockHeight) {
        panel.x = mapToItem(null, this.x, this.y).x + blockWidth
        panel.y = mapToItem(null, this.x, this.y).y

        if (panel.x + panel.width > panel.parent.width) {
            panel.x -= (panel.width + blockWidth)
        }

        if (panel.y + panel.height > panel.parent.height) {
            panel.y -= (panel.height - blockHeight)
        }
    }

    function generateItemMetadataModel() {
        funcList.clear()
        propList.clear()

        for (var i in base.item) {
            var name = i.toString()
            var metadata = {
                name: name
            }

            switch (typeof (base.item[i])) {
            case "function":
                if (BlackList.isValidFuncName(name)) {
                    funcList.append(metadata)
                }
                break
            default:
                if (BlackList.isValidPropName(name)) {
                    propList.append(metadata)
                }
                break
            }
        }
    }
}
