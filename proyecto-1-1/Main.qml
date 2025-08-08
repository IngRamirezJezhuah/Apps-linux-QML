// qml/Main.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
//import QtQuick as Project
//import QtMultimedia as Project


//ventana principal del proyecto
ApplicationWindow {
    visible: true
    width: 700
    height: 700
    title: "Ejemplo"
    color: "#1f1e20"
    
    //estas hacen que se acomoden de manera vertical
    Column {
        anchors.top: parent.top
        
        anchors.fill: ParentChange
        
        spacing: 15
    //Para textos mostrados
        Text {
            text: "¡Bienvenido!"
            font.pixelSize: 24
            color: "#fff"
        }

        Text {
            text: "Probando funciones de desarrollo de apps con Qml"
            font.pixelSize: 15
            color: "#fff"
        }
    //Para botones
        Button {
            text: "Click"
            onClicked: console.log("Haz hecho click");
        }
        
        //Para espacios de un area es como un div
        Rectangle {
            width: 10
            height: 10
            color: "transparent"
    //es para el formato de un input
            TextField {
                placeholderText: "Escribe aquí"
            }
        }
        
    }
    // est es para que se acomoden de manera horizontal
    Row{
        anchors.centerIn: parent
        spacing: 20
        //anchors.fill: parent
        
        Rectangle {
            width: 280
            height: 300
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    saludo.cambiar()
                }
                
                Image {
                    id: name
                    source: "./img/♡.jpeg"
                    width: 280
                    height: 300
                }
            }
            
        }
        
        Rectangle {
            
            width: 50
            height: 50
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#5bf0c6" }
                GradientStop { position: 1.0; color: "#1a614d" }
            }
        }
        
        
        Button{
            text:"+"
            onClicked: console.log("sumando")
        }
        Button{
            text:"-"
            onClicked: console.log("restando")
        }
    }
    
    Row{
        anchors.centerIn: parent
        anchors.margins: 10
        spacing: 20
        Rectangle{
            id: recrtalgulo1
            width: 30
            height: 30
            Text{
                topPadding: 35
                text: "vamos a ver que puedo hacer"
                color: "#fff"
            }
            Text{
                id: saludo
                topPadding: 60
                text: qsTr("a ver que pasa si picas la imagen")
                color: "#da3232"
                font.pointSize: 15
                //anchors.centerIn: parent
                
                
                function cambiar() {
                    text= "he cambiado"
                }
                
            }
            Button{
                text:"pulsame!"
                onClicked: console.log("que debo hacer")
            }
        }
    }


}