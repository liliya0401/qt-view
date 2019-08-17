import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 400
    height: 600
    clip: false

    title: qsTr("Page 1")

    //    Label {
    //       text: qsTr("You are on Page 1.")
    //       anchors.centerIn: parent
    //   }
    Text {
        id: downurl
        font.pixelSize: 12
        textFormat: Text.RichText
        font.italic: true
        text: ""
        // "ioi(<a href=\"" + link + "\">Link</a>)" ? text : "..."
        // anchors.centerIn: parent
        x: 20
        y: 80
        onLinkActivated: {
            Qt.openUrlExternally(link)
        }
    }

    TextArea {
        id: textAreaVer
        x: 20
        y: 10
        color: "#a40000"
        text: qsTr(Qt.application.version)
        //anchors.top: parent.top
        anchors.topMargin: 80
        //qsTr("version")
        font.pixelSize: 12
    }

    Button {
        id: button
        x: 222
        y: 10
        text: qsTr("Check update")
    }

    Connections {
        target: button
        onClicked: {
            textArea.text = ''
            var xmlhttp = new XMLHttpRequest()
            var url = "https://raw.githubusercontent.com/homdx/qt-view-apk/master/binapk/version.json?1"

            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    print(xmlhttp.responseText)
                    myFunction(xmlhttp.responseText)
                }
            }
            xmlhttp.open("GET", url, true)
            //xmlhttp.setRequestHeader('Authorization', 'Basic Q1hLRURwNXA2cW1NUk1nVU9HZHgyUHdIYVlyRTIwa3Y6');
            xmlhttp.send()

            function myFunction(json) {
                console.log(xmlhttp.responseText)
                var obj = JSON.parse(json)
                console.log(obj.versions[0].appver)

                console.log('start loop' + obj.versions.length)

                //                print({
                //                          "jsondata": obj.items[''].nome
                //                      })
                var i = 0
                textArea2.text = ''
                downurl.text = ''
                for (i; i < obj.versions.length; i++) {
                    //ListModel.firstName=obj.employees[i].firstName
                    //fruitModel.model.append({
                    //                            "jsondata": obj.employees[i].firstName
                    //                        })
                    console.log('i=' + i)
                    console.log(obj.versions[i].appver)
                    console.log(obj.versions[i].changesTxt)
                    textArea.text = textArea.text + obj.versions[i].appver
                            + ' -- ' + obj.versions[i].changesTxt + '\n'
                    if (textAreaVer.text == obj.versions[i].appver) {
                        //     textArea2.text = textArea2.text + obj.versions[i].appver
                        //             + ' its current version i=' + i + '\n'
                        console.log(obj.versions[i].appver + ' its current version i=' + i)
                    }

                    if (obj.versions[i].appver < textAreaVer.text) {
                        // textArea2.text = textArea2.text + obj.versions[i].appver
                        //        + ' its lover version version i=' + i + '\n'
                        console.log(obj.versions[i].appver + ' its lover version i=' + i)
                        button.text = 'Current'
                    }

                    if (obj.versions[i].appver > textAreaVer.text) {
                        textArea2.text = textArea2.text + obj.versions[i].appver
                                + ' - ' + obj.versions[i].changesTxt + '\n'
                        console.log(obj.versions[i].appver + ' its upper version i=' + i)
                        downurl.text = downurl.text + "Скачать " + obj.versions[i].appver + ' '
                                + "<a href=\"https://github.com/homdx/qt-view-apk/releases/download/"
                                + obj.versions[i].appver + "/qt-view.apk" + "\">версию</a><br>\n"
                        button.text = 'Update aviable'
                    }
                }
            }
            //print('count is ' + listView.count)
            //listView.view.red
            console.log('delegate')
            //ListView.delegate = obj.employees
            //print(listView.model)
            //listView.positionViewAtIndex(listView.count - 1, ListView.End)
            //print(listView.preferredHighlightBegin)
            print("clicked1")
            print("clicked2")
        }
    }

    TextArea {
        id: textArea2
        x: 10
        y: 250
        width: 600
        height: 200
        text: qsTr("")
    }

    TextArea {
        id: textArea
        x: 20
        y: 350
        width: 600
        height: 200
        text: qsTr("")
    }
}
