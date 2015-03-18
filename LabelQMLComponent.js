var flagComp = Qt.createComponent("../ObjectNameFlag.qml")
var displayBoard

function createDisplayBoard(item) {
    displayBoard = Qt.createComponent(
                "../ObjectNameDisplayBoard.qml").createObject(item)
}

function removeObjectNameFlag(item) {
    for (var i = 0; i < item.children.length; i++) {
        if (item.children[i].objectName === "DYN_NAME_FLAG") {
            item.children[i].destroy()
        }
        removeObjectNameFlag(item.children[i])
    }
}

function addObjectNameFlag(item, prefix) {

    if (prefix === undefined) {
        prefix = ""
    }

    for (var i = 0; i < item.children.length; i++) {

        if (item.children[i].objectName !== "objectNameDisplayBoard") {
            if (item.children[i].objectName != "") {
                addObjectNameFlag(item.children[i],
                                  prefix + item.children[i].objectName + "->")
            } else {
                addObjectNameFlag(item.children[i], prefix + "[]->")
            }

            if (item.children[i].objectName !== "") {
                flagComp.createObject(item.children[i], {
                                          objectName: "DYN_NAME_FLAG",
                                          displayBoard: displayBoard,
                                          labelName: item.children[i].objectName,
                                          labelPath: prefix,
                                          item: item.children[i]
                                      })
            }
        }
    }
}
