var flagComp = Qt.createComponent("ObjectNameFlag.qml")
var displayBoard;

function createDisplayBoard(item) {
    displayBoard = Qt.createComponent("ObjectNameDisplayBoard.qml").createObject(item)
}

function removeObjectNameFlag(item) {
    for (var i = 0; i < item.children.length; i++) {
        if (item.children[i].objectName === "DYN_NAME_FLAG") {
            item.children[i].destroy()
        }
        removeObjectNameFlag(item.children[i])
    }
}

function addObjectNameFlag(item) {

    for (var i = 0; i < item.children.length; i++) {

        if (item.children[i].objectName !== "objectNameDisplayBoard") {
            addObjectNameFlag(item.children[i])
            if (item.children[i].objectName !== "" &&
                item.children[i].objectName !== undefined)
            flagComp.createObject(item.children[i], {
                                      objectName: "DYN_NAME_FLAG",
                                      displayBoard: displayBoard,
                                      label: item.children[i].objectName
                                  })
        }
    }
}
