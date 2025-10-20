import QtQuick
import QtQuick.Controls

ApplicationWindow{
    Column {
            anchors.fill: parent //hace que ocupe todo a la vez
            anchors.margins: 10 //con un margen de 10px
            spacing: 5 //estapacio de 5 px entre cada hijo
            // ... (anclas, espaciado)
            TextField {
                id: nameInput
                width: parent.width
                placeholderText: "Escribe tu nombre"
            }

            Text {
                id: greetingLabel
                text: "Esperando..."
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: myButton
                text: "Saludar"
                anchors.horizontalCenter: parent.horizontalCenter
                
                // El manejador de evento "clic"
                onClicked: {
                    // Esto es JavaScript
                    console.log("¡Botón presionado!")
                    
                    // ¡Podemos cambiar propiedades de otros elementos!
                    // Gracias al 'id', podemos referirnos a ellos
                    greetingLabel.text = "¡Hola, " + nameInput.text + "!"
                    greetingLabel.color = "blue"
                }
            }
        }
}