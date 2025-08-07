// qml/Main.qml
import QtQuick 
import QtQuick.Controls 
import QtQuick.Window 

ApplicationWindow {
    visible: true
    width: 700
    height: 700
    title: "Ejemplo"
    
    Column {
        anchors.top: parent.top
        
        anchors.fill: ParentChange
        
        spacing: 15
    
        Text {
            text: "¡Bienvenido!"
            font.pixelSize: 24
        }

        Text {
            text: "Probando funciones de desarrollo de apps con Qml"
            font.pixelSize: 15
        }

        Button {
            text: "Click"
            onClicked: console.log("Haz hecho click");
        }
        
        
        Rectangle {
            width: 10
            height: 10
            color: "transparent"

        TextField {
            placeholderText: "Escribe aquí"
        }
        }
        
    }

    Row{
        anchors.centerIn: parent
        spacing: 20

        Rectangle {
            width: 280
            height: 300
            color: "skyblue"
            
            Image {
                id: name
                source: "./img/♡.jpeg"
                width: 280
                height: 300
            }
        }
        
        Rectangle {
            
            width: 50
            height: 50

            gradient: Gradient {
                GradientStop { position: 0.0; color: "#f0c35b" }
                GradientStop { position: 1.0; color: "#B54935" }
            }
        }
        
        Button{
            text:"+"
            onClicked: console.log("sumando")
        }
    }
}