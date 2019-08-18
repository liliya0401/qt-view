import QtQuick 2.5
import QtQuick.Controls 2.5

import "common"


Page {
    //    width: 400
    //    height: 600
    clip: false

    title: qsTr("Заказы")

    Background {
        width: 140
        height: 300

        ListView {
            id: lv1

            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.margins: 20
            width: 40

            clip: true

            model: 100

            delegate: numberDelegate
            spacing: 5
            Tracer {}
        }

        ListView {
            id: lv2

            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 20
            width: 40

            model: 100

            delegate: numberDelegate
            spacing: 5
            Tracer {}
        }

        Component {
            id: numberDelegate

            GreenBox {
                width: 40
                height: 40
                text: index
            }
        }

        Component.onCompleted: {
            lv1.contentY = 15;
            lv2.contentY = 15;
        }
    }
}
