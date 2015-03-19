import QtQuick 2.0

ListView {
    signal itemSelected
    clip: true
    delegate: Text {
        text: " " + name + " "
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                currentIndex = index
                itemSelected()
            }
        }
    }

    width: 180
    height: base.height - label.height
    highlight: Rectangle {
        color: "lightsteelblue"
        radius: 5
    }
    highlightMoveVelocity: 1000000
    highlightFollowsCurrentItem: true
    keyNavigationWraps: true
}

