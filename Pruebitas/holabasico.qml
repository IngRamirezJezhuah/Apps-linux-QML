//Main.qml
//1. Importa las "cajas de herramientas" que necesitamos
import QtQuick
import QtQuick.Controls
//2. El objeto Raiz (la ventana)
ApplicationWindow {
    //3. Propiedades: se adignan con dos putnos (:)
    id: rootWindow //Un nombre (ID) unico para referirnos a esta ventana
    width: 640
    height: 480
    visible: true //¡Super importante! Si no, la ventana exixte pero no se ve
    title: "Mi aplicacion funcional"
        
        //4. Objetos Hijos: se anidan dentro del Padre
        //ejemplo de pantalla gnral
        Rectangle{
            id: myRect
            color: "lightblue"
            // === ¡EL BINDING! ===
            // "width" siempre será la mitad del ancho de la ventana.
            // Si redimensionas la ventana, ¡el rectángulo se ajustará solo!
            width: rootWindow.width / 2 
            // "height" siempre será igual a su propio "width"
            height: width // QML entiende que te refieres al "width" de myRect
            anchors.centerIn: parent
            Text{
                id: myLabel
                text: "Hola bienvenido a esto que es mi primera app funcional"
                //"anchors" es como un padding
                anchors.centerIn: parent //Centra este texto en su "padre (la ventana en la que esta)"
                width: myRect.width
                height: width
            }
        }
        
    
}
