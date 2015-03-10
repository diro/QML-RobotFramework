import QtQuick 2.3

Rectangle {
    objectName:"root"
    property alias mouseArea: mouseArea

    width: 360
    height: 360

    MouseArea {
        id: mouseArea
        objectName:"mos1"
        anchors.fill: parent

    }

    Text {
    objectName:"textaa"
        anchors.centerIn: parent
        text: "Get component"

    }

    Text {
        x: 59
        y: 87
        objectName: "comp1"
        text: "I AM COMP1"
    }

    Rectangle
    {
        width:100
        height:30
        objectName:"compContainer"
        color:"blue"
        Text {
            objectName: "inside"
        anchors.centerIn: parent
        text: "I AM COMP2"
        z:10

        }
    }
}
