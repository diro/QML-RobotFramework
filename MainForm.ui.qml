import QtQuick 2.3

Rectangle {
    objectName: "root"
    property alias mouseArea: mouseArea

    width: 640
    height: 640

    Rectangle {
        x: 100
        y: 100
        color: "pink"
        width: 100
        height: 100
        MouseArea {
            id: mouseArea
            objectName: "mos1"
            anchors.fill: parent
        }
    }

    Text {
        x: 59
        y: 87
        objectName: "comp1"
        text: "I AM COMP1"
    }

    Rectangle {
        width: 100
        height: 30
        objectName: "compContainer"
        color: "blue"
        Text {
            objectName: "inside"
            anchors.centerIn: parent
            text: "I AM COMP2"
            z: 10
        }
    }
}
