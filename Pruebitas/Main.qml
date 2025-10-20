//Main.qml
//1. Importa las "cajas de herramientas" que necesitamos
import QtQuick
import QtQuick.Controls
import QtQuick.Window
//2. El objeto Raiz (la ventana)
ApplicationWindow {
    //3. Propiedades: se adignan con dos putnos (:)
    id: rootWindow //Un nombre (ID) unico para referirnos a esta ventana
    width: 640
    height: 480
    visible: true //¡Super importante! Si no, la ventana exixte pero no se ve
    title: "Mi aplicacion funcional"
    Column{
        id: colum1
        Text {
            id: txt1
            text: "¡Bienvenido!"
            font.pixelSize : 24
            color: "#fff"
        }
        Text {
            text: "Probando funcionalidades de desarrollo con QML"
            font.pixelSize: 15
            color: "#fff"
        }
        Button {
            text: "hazme Click"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    saludo.cambiar()
                }
            }
        }
        Rectangle {
            width: 280
            height: 300
            gradient: Gradient {
                GradientStop { position: 0.0; color: '#b2d1c8' }
                GradientStop { position: 1.0; color: '#253a54' }
            }
            color: '#c7e0f7e9'
            Text{
                id: saludo
                topPadding: 60
                leftPadding: 10
                text: qsTr("a ver que pasa si picas al boton")
                color: '#040404'
                font.pointSize: 15
                //anchors.centerIn: parent
                
                function cambiar() {
                    text= "he cambiado"
                }
            }
        }
    }
    
}
