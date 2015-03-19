import QtQuick 2.0

ListView {

    model: ListModel {
        ListElement {
            name: " Get Property "
        }
        ListElement {
            name: " Set Property "
        }
        ListElement {
            name: " Invoke Method "
        }
        ListElement {
            name: " Click it! "
        }
    }
    delegate: Text {
        text: name
        MouseArea {

            anchors.fill: parent
            onClicked: {
                action.currentIndex = index
                console.log("action:" + index)
                switch (index) {
                case 0:

                case 1:
                    member.model = propModel
                    break
                case 2:
                    member.model = funcModel
                    break
                case 3:
                    member.model = ""
                }
            }
        }
    }
    highlight: Rectangle {
        color: "lightsteelblue"
        radius: 5
    }
}

