.pragma library

var funcBlackList = ['forceActiveFocus', 'nextItemInFocusChain', 'childAt', 'mapToItem', 'mapFromItem']
var propBlackList = ['states', 'transitions', 'implicitWidth', 'implicitHeight']

function init()
{
    propBlackList.push('smooth', 'transform', 'state', 'layer',
                       'hoverEnabled')
    propBlackList.push('childrenRect', 'visibleChildren', 'anchors',
                       'horizontalCenter')
    propBlackList.push('antialiasing', 'drag', 'preventStealing',
                       'propagateComposedEvents')
    propBlackList.push('containPress', 'transformOrigin',
                       'transformOriginPoint')
    propBlackList.push('objectName', 'parent', 'data', 'resources',
                       'children', 'top', 'bottom')
    propBlackList.push('verticalCenter', 'baseline', 'baselineOffset')
    propBlackList.push('clip', 'focus', 'activeFocus', 'activeFocusOnTab',
                       'mouseX', 'mouseY', 'containsMouse')
    propBlackList.push('pressedButtons', 'acceptedButtons', 'containPress')

}

function isValidPropName(name) {
    return propBlackList.indexOf(name) === -1;
}

function isValidFuncName(name) {
    return (name.indexOf("Changed") === -1 && funcBlackList.indexOf(name) === -1);

}

