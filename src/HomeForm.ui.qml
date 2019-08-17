import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    width: 400
    height: 600

    title: qsTr(Qt.application.version) ? title : qsTr("Home")

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

    Button {
        id: button
        x: 222
        y: 68
        text: qsTr("Button")
    }

    TextArea {
        id: textArea
        x: 81
        y: 20
        width: 100
        height: 100
        text: qsTr("t
e
s
t
")
    }
    ListView {
        id: listView
        x: 35
        y: 147
        width: 110
        height: 160
        model: ListModel {
            ListElement {
                firstName: "Grey first"
                lastName: "Grey last"
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                firstName: "Red first"
                lastName: "Red last"
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                firstName: "Blue first"
                lastName: "Blue last"
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                firstName: "Green first"
                lastName: "Green last"
                name: "Green"
                colorCode: "green"
            }
        }
        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                }

                Text {
                    text: name
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                spacing: 10
                Text {
                    text: firstName
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                Text {
                    text: lastName
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
            }
        }
    }
    Connections {
        target: button
        onClicked: {
            textArea.text = ''
            var xmlhttp = new XMLHttpRequest()
            var url = "http://www.evileg.ru/it_example.json"

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
                var obj = JSON.parse(json)
                console.log(xmlhttp.responseText)

                console.log('start loop' + obj.employees.length)

                //                print({
                //                          "jsondata": obj.items[''].nome
                //                      })
                var i = 0
                for (i; i < obj.employees.length; i++) {
                    //ListModel.firstName=obj.employees[i].firstName
                    //fruitModel.model.append({
                    //                            "jsondata": obj.employees[i].firstName
                    //                        })
                    console.log('i=' + i)
                    console.log(obj.employees[i].firstName)
                    textArea.text = textArea.text + obj.employees[i].firstName + '\n'
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
}
