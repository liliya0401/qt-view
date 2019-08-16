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

    TextArea {
        id: textAreaVer
        x: 60
        y: 20
        color: "#a40000"
        text: 'this' + qsTr(Qt.application.version)
        //anchors.top: parent.top
        anchors.topMargin: 80
        //qsTr("version")
        font.pixelSize: 12
    }

    Button {
        id: button
        x: 222
        y: 68
        text: qsTr("Button")
    }

    Connections {
        target: button
        onClicked: {
            textArea.text = ''
            var xmlhttp = new XMLHttpRequest()
            var url = "https://raw.githubusercontent.com/homdx/qt-view/master/binapk/version.json?1"

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
                        textArea2.text = textArea2.text + obj.versions[i].appver
                                + ' its current version i=' + i + '\n'
                        console.log(obj.versions[i].appver + ' its current version i=' + i)
                    }

                    if (obj.versions[i].appver < textAreaVer.text) {
                        textArea2.text = textArea2.text + obj.versions[i].appver
                                + ' its lover version version i=' + i + '\n'
                        console.log(obj.versions[i].appver + ' its lover version i=' + i)
                    }

                    if (obj.versions[i].appver > textAreaVer.text) {
                        textArea2.text = textArea2.text + obj.versions[i].appver
                                + ' its upper version i=' + i + '\n'
                        console.log(obj.versions[i].appver + ' its upper version i=' + i)
                    }
                }
            }
            button.text = 'done'
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
        x: 60
        y: 300
        width: 600
        height: 200
        text: qsTr("Text Area")
    }

    TextArea {
        id: textArea
        x: 60
        y: 100
        width: 600
        height: 200
        text: qsTr("Text Area")
    }
}
