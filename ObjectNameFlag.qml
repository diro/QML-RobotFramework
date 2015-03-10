import QtQuick 2.0

Item
{
    id:base
    property var displayBoard
    property string label:""
    Rectangle
    {
        id:"rectLabelFlag"
        color:"red"
        width:10
        height:10
        radius:2
        opacity:0.5

        MouseArea
        {
            anchors.fill:parent
            hoverEnabled: true
            onEntered: {
                displayBoard.text = base.label
            }
            onExited: {
                displayBoard.text = ""
            }
        }
    }

}
