import QtQuick 2.0

Item {
    id: base
    property var item
    property int itemIndex
    property var displayBoard
    property var root
    property string labelName: ""
    property string labelPath: ""
    //property variant propList: [""]
    //property variant funcList: [""]
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
            width: 10
            height: 10
            color: "#ff0000"
            radius: 2

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onEntered: {

                    //console.log("coord:" + this.x + "," + this.y);
                    //displayBoard.x = this.x + this.width;
                    //displayBoard.y = this.y;
                    itemBorder.border.color = "red"
                    displayBoard.labelName = base.labelName
                    displayBoard.labelPath = base.labelPath

                    base.generateItemMetadata()

                    displayBoard.funcModel = funcList
                    displayBoard.propModel = propList
                    //displayBoard.x = mapToItem(null, this.x, this.y).x
                    //displayBoard.y = mapToItem(null, this.x, this.y).y
                    //displayBoard.visible=true;

                }
                onExited: {
                    itemBorder.border.color = "transparent"
                }
                onClicked: {
                    //displayBoard.copyToClipBoard()
                    if (rectLabelFlag.color == "#ff0000")
                    {
                        rectLabelFlag.color = "#00dd00"
                    }
                    else
                    {
                        rectLabelFlag.color = "#ff0000"
                    }

                    displayBoard.visible=!displayBoard.visible
                }
            }
        }
    }

    function generateItemMetadata() {
        for (var i in base.item) {
            if (typeof (base.item[i]) === "function") {
                if (i.toString().indexOf("Changed") === -1)
                {
                    var func = {
                        name: i.toString()
                    }
                    funcList.append(func)
                }
            } else {
                var prop = {
                    name: i.toString()
                }
                propList.append(prop)
            }
        }
        console.log("prop count:" + propList.count)
    }
}
