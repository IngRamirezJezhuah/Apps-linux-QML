import QtQuick
import QtQuick.Controls

ApplicationWindow {
    // ... (width, height, visible, title)

    // Un layout de Columna que ocupa toda la ventana
    Column {
        anchors.fill: parent // Haz que la columna ocupe toda la ventana
        anchors.margins: 10  // Con un margen de 10px
        spacing: 5           // Espacio de 5px entre cada hijo

        Text {
            text: "Nombre:"
            font.bold: true
        }
        
        TextField { // Un campo para escribir texto
            id: nameInput
            placeholderText: "Escribe tu nombre aquí"
            // El layout se encarga del 'y', nosotros del 'width'
            width: parent.width // Que ocupe todo el ancho de la columna
        }
        
        Button {
            text: "Saludar"
            anchors.horizontalCenter: parent.horizontalCenter // Centra solo este botón
        }
    }
}