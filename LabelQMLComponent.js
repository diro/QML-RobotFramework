function removeObjectNameLabel(item) {
    for (var i = 0; i < item.children.length; i++) {
        if (item.children[i].objectName === "DYN_NAME_LABEL") {
            item.children[i].destroy();
        }
        removeObjectNameLabel(item.children[i])

    }
}

function addObjectNameLabel(item) {
    for (var i = 0; i < item.children.length; i++) {
        addObjectNameLabel(item.children[i]);
        var newObject = Qt.createQmlObject('import QtQuick 2.0; Text {objectName:"DYN_NAME_LABEL";font.pixelSize:12;color: "white"; height: 10;text:"'+ item.children[i].objectName + '";Rectangle{height:parent.paintedHeight;width:parent.paintedWidth;color:"black";border.width:1;border.color:"orange";opacity:0.4;z:-1}}', item.children[i]);
    }
}
