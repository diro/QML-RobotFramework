import QtQuick 2.0

Rectangle
{
    signal clicked;
    radius:3
    property alias text:label.text
    anchors.topMargin: 4
    anchors.leftMargin: 5
    width:40
    height:20
    color:"black"
    Text
    {
        id:label
        anchors.centerIn: parent
        color:"white"
        text:"Clear"
    }

    MouseArea
    {
        anchors.fill:parent
        onClicked:
        {
            parent.clicked(mouse);
        }
    }
}
