import QtQuick 2.0
import QtQuick.Controls 1.3

Rectangle {
    id: base
    objectName: "objectNameDisplayBoard"
    visible:false;
    property string labelPath: ""
    property string labelName: ""
    property alias editor: editor
    property alias candidate: candidate
    property variant funcModel
    property variant propModel

    height: 350
    x: parent.width / 2
    y: parent.height / 2
    color: "#dddddd"
    width: 640
    opacity: 0.9
    onLabelNameChanged: {
        action.currentIndex = 0
        candidate.model = funcModel
    }
    Text {
        id: label
        font.pixelSize: 24
        font.family: "Verdana"
        color: "blue"
        height: 40
        width: parent.width
        text: parent.labelPath + parent.labelName
        Rectangle {
            id: labelBorder
            anchors.fill: parent
            color: "black"
            border.width: 1
            border.color: "orange"
            opacity: 0.4
            z: -1
        }
    }

    ListView {
        anchors.left: label.left
        anchors.top: label.bottom
        height: base.height - label.height
        width: 120
        id: action
        model: ListModel {
            ListElement {
                name: "Get Property -"
            }
            ListElement {
                name: "Set Property -"
            }
            ListElement {
                name: "Invoke Method - "
            }
            ListElement {
                name: "Click it! "
            }
        }
        delegate: Text {
            text: name
            MouseArea {

                anchors.fill: parent
                hoverEnabled: true

                onClicked: {
                    action.currentIndex = index
                    console.log("action:" + index)
                    switch (index) {
                    case 0:

                    case 1:
                        candidate.model = propModel
                        break
                    case 2:
                        candidate.model = funcModel
                        break
                    case 3:
                        candidate.model = ""
                    }
                }
            }
        }
        highlight: Rectangle {
            color: "lightsteelblue"
            radius: 5
        }
    }

    ListView {
        id: candidate
        clip: true
        anchors.left: action.right
        anchors.top: action.top
        delegate: Text {
            text: name
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true

                onClicked: {
                    candidate.currentIndex = index
                }
            }
        }
        model: propModel
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

    Rectangle {
        id: btnGenKeyword
        width: 30
        height: 30
        anchors.left: candidate.right
        //anchors.top: candidate.center
        y: 200
        radius:10
        color: "black"
        Text {
            anchors.centerIn: parent
            text: "GO!"
            color: "white"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                switch (action.currentIndex) {
                case 0:
                    var propName = propModel.get(candidate.currentIndex).name
                    editor.append(
                                "  ${res}  =  Get Property    " + base.labelName + "  " + propName)
                    break
                case 1:
                    var propName = propModel.get(candidate.currentIndex).name
                    editor.append("  Set Property    " + base.labelName + "  "
                                  + propName + "    ${" + propName + "}")
                    break
                case 2:
                    var funcName = funcModel.get(candidate.currentIndex).name
                    editor.append(
                                "  Invoke Method    " + base.labelName + "  " + funcName + "  []")
                    break
                case 3:
                    editor.append(
                                "  ${res} =  Click    " + base.labelName + "  vast2_mainwin")
                    break
                }
            }
        }
    }

    TextArea {
        id: editor
        anchors.top: action.top
        anchors.left: btnGenKeyword.right
        width: base.width - action.width - candidate.width - btnGenKeyword.width
        height: candidate.height
        text: ""
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
