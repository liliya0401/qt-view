import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    width: 400
    height: 600

    title: qsTr("Home ") + qsTr(Qt.application.version)

    Label {
        text: qsTr("You are on the home page.")
        anchors.centerIn: parent
    }

    Text {
        id: versionlbl
        x: 151
        color: "#a40000"
        text: qsTr(Qt.application.version)
        anchors.top: parent.top
        anchors.topMargin: 80
        //qsTr("version")
        font.pixelSize: 12
    }
}




/*##^## Designer {
    D{i:2;anchors_y:134}
}
 ##^##*/
