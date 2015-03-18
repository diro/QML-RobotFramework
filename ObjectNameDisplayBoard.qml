import QtQuick 2.0
import QtQuick.Controls 1.3

Rectangle {
    id: base
    objectName: "objectNameDisplayBoard"
    visible: false
    property string labelPath: ""
    property string labelName: ""
    property alias editor: editor
    property alias candidate: candidate
    property variant funcModel
    property variant propModel
    radius:5
    height: 350
    x: parent.width / 2
    y: parent.height / 2
    color: "#dddddd"
    width: 640
    opacity: 0.9
    border.width:1
    border.color:"#49491d"
    onLabelNameChanged: {
        action.currentIndex = 0
        candidate.model = funcModel
    }
    TextArea {
        id: editor
        anchors.top: action.top
        anchors.left: btnGenKeyword.right
        anchors.leftMargin: 5
        width: base.width - action.width - candidate.width - btnGenKeyword.width - 12
        height: candidate.height - 6
        text: ""
        font.pixelSize: 10
        focus: true
    }

    Rectangle {
        id:label
        height: 28
        anchors.horizontalCenter:parent.horizontalCenter
        y:parent.border.width
        width: parent.width - 2
        color:"#333322"
        opacity:0.9
        Text {
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top:parent.top
            anchors.topMargin: 3
            font.pixelSize:18
            font.family: "Verdana"
            color: "#e6f3cf"
            width: base.width
            text: "<b>OBJECT NAME</b>  " + "<font color=\"white\">" + base.labelName +"</font>"
        }
    }

    MouseArea {
        hoverEnabled: true
        propagateComposedEvents: true
        anchors.fill: parent
        onEntered: {
            timerHide.stop()
        }
        onExited: {
            timerHide.restart()
        }

        onClicked: {
            mouse.accepted = false
        }


    }

    ListView {
        anchors.left: label.left
        anchors.top: label.bottom
        anchors.topMargin: 2
        anchors.leftMargin: 3
        height: base.height - label.height
        width: 120
        id: action

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
            text: " " + name + " "
            MouseArea {
                id: mouseArea
                anchors.fill: parent
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
        radius: 10
        color: "black"
        Text {
            anchors.centerIn: parent
            text: "GO!"
            color: "white"
        }
        MouseArea {
            hoverEnabled: false
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

    TextInput {
        id: objtext
        text: base.labelName
        visible: false
    }



    function copyToClipBoard() {
        objtext.selectAll()
        objtext.copy()
    }
    Timer {
        id: timerHide
        interval: 300
        onTriggered: {
            base.visible = false
        }
        repeat: false
    }
    function show() {
        timerHide.stop()
        base.visible = true
    }

    function delayHide() {
        timerHide.start()
    }
}
