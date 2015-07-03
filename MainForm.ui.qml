import QtQuick 2.3

Rectangle {
    objectName: "root"
    property alias mouseArea: mouseArea

    width: 640
    height: 640


    Rectangle {
        anchors.centerIn: parent

        color: "pink"
        width: 100
        height: 100
        MouseArea {
            id: mouseArea
            anchors.centerIn: parent

            objectName: "mos1"
            anchors.fill: parent

            Text {
                id: text1
                anchors.centerIn: parent
                text: qsTr("Switch RED DOT")
                font.pixelSize: 12
            }
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

    Rectangle {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 30
        width:100
        objectName: "compContainer2"
        color: "#3433aa"
        Text {
            objectName: "inside2"
            anchors.centerIn: parent
            text: "I AM COMP3"
            z: 10
        }
    }

    Rectangle {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        height: 30
        width:100
        objectName: "compContainer3"
        color: "#aa33aa"
        Text {
            objectName: "inside3"
            anchors.centerIn: parent
            text: "I AM COMP4"
            z: 10
        }
    }

}
