import QtQuick 2.0
import QtQuick.Controls 1.3

Rectangle {
    id: base
    objectName: "objectNameDisplayBoard"
    visible: false
    property string labelPath: ""
    property string labelName: ""
    property variant funcModel
    property variant propModel
    radius: 5
    height: 350
    x: parent.width / 2
    y: parent.height / 2
    color: "#dddddd"
    width: 640
    opacity: 0.9
    border.width: 1
    border.color: "#49491d"

    onLabelNameChanged: {
        action.currentIndex = -1
        member.currentIndex = -1
        member.model = ""
    }

    TextArea {
        id: keywordEditor
        anchors.top: action.top
        anchors.left: member.right
        anchors.leftMargin: 5
        width: base.width - action.width - member.width - 12
        height: member.height - 6 - 40
        text: ""
        font.pixelSize: 10
    }

    SimpleButton {
        id: btnEdit
        anchors.top: keywordEditor.bottom
        anchors.left: member.right
        text: "Edit"
        onClicked: {
            keywordEditor.focus = true
        }
    }

    SimpleButton {
        id: btnCopy
        anchors.top: keywordEditor.bottom
        anchors.left: btnEdit.right
        text: "Copy"
        onClicked: {
            keywordEditor.selectAll()
            keywordEditor.copy()
        }
    }

    SimpleButton {
        anchors.top: keywordEditor.bottom
        anchors.left: btnCopy.right
        text: "Clear"

        onClicked: {
            keywordEditor.text = ""
        }
    }

    ObjectNameLabel {
        id: label
        text: "<b>OBJECT NAME</b>  " + "<font color=\"white\">" + base.labelName + "</font>"
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

    ActionPicker {
        anchors.left: label.left
        anchors.top: label.bottom
        anchors.topMargin: 2
        anchors.leftMargin: 3
        height: base.height - label.height
        width: 120
        id: action

        onCurrentIndexChanged: {
            switch (currentIndex) {
            case 0:

            case 1:
                member.model = propModel
                break
            case 2:
                member.model = funcModel
                break
            case 3:
                member.model = ""
                generateKeyword(currentIndex)
            }
        }
    }

    MemberPicker {
        id: member
        anchors.left: action.right
        anchors.top: action.top
        model: funcModel

        onModelChanged: {
            currentIndex = -1
        }

        onItemSelected: {
            generateKeyword(action.currentIndex)
        }
    }

    function generateKeyword(action) {
        var propName;
        var funcName;
        switch (action) {
        case 0:
            propName = propModel.get(member.currentIndex).name
            keywordEditor.append(
                        "  ${res}  =  Get Property    " + base.labelName + "  " + propName);
            break;
        case 1:
            propName = propModel.get(member.currentIndex).name
            keywordEditor.append("  Set Property    " + base.labelName + "  "
                                 + propName + "    ${" + propName + "}");
            break;
        case 2:
            funcName = funcModel.get(member.currentIndex).name
            keywordEditor.append(
                        "  Invoke Method    " + base.labelName + "  " + funcName + "  []");
            break;
        case 3:
            keywordEditor.append(
                        "  ${res} =  Click    " + base.labelName + "  vast2_mainwin");
            break;
        }
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

    TextInput {
        id: textObjectName
        text: base.labelName
        visible: false
    }

    function copyToClipBoard() {
        textObjectName.selectAll()
        textObjectName.copy()
    }
}
