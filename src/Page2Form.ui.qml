import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 400
    height: 600

    title: qsTr("Page 2")

    Label {
        text: qsTr("You are on Page 2.")
        anchors.centerIn: parent
    }
}
