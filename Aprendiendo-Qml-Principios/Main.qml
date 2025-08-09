import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    //minimumWidth: 300
    //minimumHeight: 300

    Rectangle {
        id: principal
        width: parent.width * 0.8
        height: parent.height * 0.5
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        color: "#515151"
        radius: 10
        // Limitar tamaño mínimo para evitar que se achique demasiado
        //minimumWidth: 200
        //minimumHeight: 150
    }

    Button {
        text: "clickeame!"
        anchors.top: principal.bottom
        anchors.horizontalCenter: principal.horizontalCenter
        anchors.topMargin: 15
        width: Math.min(principal.width * 0.3, 150)
        height: 40
        onClicked: console.log("restando")
    }

    Rectangle {
        id: container
        anchors.top: button.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: principal.horizontalCenter
        width: principal.width * 0.8
        height: Math.max(parent.height * 0.3, 250)
        color: "lightgrey"
        radius: 8
        //minimumWidth: 300

        Rectangle {
            id: sidebar
            width: Math.min(100, container.width * 0.3)
            height: parent.height
            color: "#8e5a5a"
            anchors.left: parent.left
            radius: 8
        }

        Rectangle {
            id: contentArea
            anchors.left: sidebar.right
            anchors.right: parent.right
            height: parent.height
            color: "#f3eeee"
            radius: 8

            Rectangle {
                anchors.centerIn: parent
                width: parent.width * 0.8
                height: parent.height * 0.5
                color: "#8cf259"
                radius: 6
                //minimumWidth: 100
                //minimumHeight: 80

                Text {
                    id: name
                    text: qsTr("Hola qml")
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    color: "black"
                }
            }
        }
    }
}
