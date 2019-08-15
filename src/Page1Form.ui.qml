import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 400
    height: 600
    clip: false

    title: qsTr("Page 1")

    Label {
        text: qsTr("You are on Page 1.")
        anchors.centerIn: parent
    }
}
