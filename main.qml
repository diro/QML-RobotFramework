import QtQuick 2.4
import QtQuick.Window 2.2
import "LabelQMLComponent.js" as LabelQML
Window {

    visible: true
    property bool showName: false
    MainForm {
        anchors.fill: parent
        Component.onCompleted: {LabelQML.createDisplayBoard(this)   }
        mouseArea.onClicked: {
            if (!showName) {
                LabelQML.addObjectNameFlag(this);
                showName = true;
            } else {
                LabelQML.removeObjectNameFlag(this);
                showName = false;
            }
        }
    }

}
