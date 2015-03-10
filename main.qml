import QtQuick 2.4
import QtQuick.Window 2.2
import "LabelQMLComponent.js" as LabelQML
Window {
    visible: true
    property bool showName: false
    MainForm {
        anchors.fill: parent
        mouseArea.onClicked: {
            if (!showName) {
                LabelQML.addObjectNameLabel(this);
                showName = true;
            } else {
                LabelQML.removeObjectNameLabel(this);
                showName = false;
            }
        }

    }
}
