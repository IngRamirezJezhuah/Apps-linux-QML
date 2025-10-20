# Documentacion de qml para no perderme


# Puntos Clave:

>import: Le dice a QML qué componentes cargar. QtQuick tiene los básicos (Rectangle, Text, Image) y QtQuick.Controls tiene los modernos (Button, TextField, Slider).

>id: Es un nombre único (dentro de este archivo) para poder referenciar un elemento desde otro.

>Propiedad: valor: Así se asigna todo.

>Anidación: Poner un Text dentro de ApplicationWindow lo hace su "hijo". La parent (padre) del Text es la ApplicationWindow.

## El superpoder de QML : "Property Bidings" (Enlaces)


>>Este es el concepto más importante de QML. Un enlace (binding) no es una asignación de una sola vez, es una relación permanente. Se usa el símbolo de dos puntos (:). Ejemplo SIN binding (Malo):

### QML

Rectangle {
    width: 100 // width siempre será 100
}

Ejemplo CON binding (¡Mágico!):

QML :

    ApplicationWindow {
        id: rootWindow
        width: 640
        height: 480

        Rectangle {
            id: myRect
            color: "lightblue"

            // === ¡EL BINDING! ===
            // "width" siempre será la mitad del ancho de la ventana.
            // Si redimensionas la ventana, ¡el rectángulo se ajustará solo!
            width: rootWindow.width / 2 
            
            // "height" siempre será igual a su propio "width"
            height: width // QML entiende que te refieres al "width" de myRect
            
            anchors.centerIn: parent
        }
    }
¡No tuviste que escribir código para "manejar el evento de redimensión"! Simplemente declaraste la relación. QML se encarga del resto.

# Posicionamiento: Layouts (La Forma Correcta)

>>Nunca posiciones cosas con x: 10 y y: 20. Es una pesadilla de mantener. Siempre usa Layouts (contenedores) o Anchors (anclas).

$ Column: Apila hijos verticalmente.

$Row: Apila hijos horizontalmente.

$GridLayout: Una cuadrícula.

QML

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

# Interactividad: Señales y Eventos (JavaScript)

>>Cómo respondes a un clic? Usando "manejadores de señales" (signal handlers). Son funciones que empiezan con on... Cualquier código que escribes dentro de un manejador de señal es JavaScript.

QML

    Column {
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

# Creando una App "Funcional" (Conectando a C++) 🔧

>>Aquí es donde se une todo. Quieres que QML maneje el clic, pero que C++ haga el trabajo pesado (como guardar un archivo).

$Paso 1: El "Backend" en C++
Crea una nueva clase en C++ que herede de QObject. Esta será tu "API" para QML.

(Ejemplo) AppBackend.h

    #ifndef APPBACKEND_H
    #define APPBACKEND_H

    #include <QObject>
    #include <QDebug>
    #include <QString>

    class AppBackend : public QObject
    {
        Q_OBJECT // Macro obligatoria para señales, slots y Q_INVOKABLE

    public:
        explicit AppBackend(QObject *parent = nullptr) : QObject(parent) {}

        // ¡La función mágica!
        // Q_INVOKABLE permite que QML llame a esta función de C++
        Q_INVOKABLE void saveMessage(const QString &message)
        {
            // Aquí iría tu lógica real de C++ (ej. QFile, QNetworkRequest)
            // Por ahora, solo imprimimos a la consola de depuración
            qDebug() << "C++ RECIBIÓ EL MENSAJE:" << message;
            qDebug() << "Simulando guardado en /home/djxs4n/documento.txt...";
            // ... lógica de guardado ...
        }
    };

    #endif // APPBACKEND_H

