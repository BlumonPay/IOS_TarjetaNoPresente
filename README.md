# Blumon Pay Tarjeta No Presente IOS API

SDK para integración de pagos electronicos en su propia aplicacion ios swift 2.3
Para transaccionar en produccion con Blumon Pay se requiere de solicitar una alta de usuario al correo: helloworld@blumonpay.com

## Integración utilizando XCODE - Swift 2.3

Para iniciar usted debera seguir los siguientes pasos ( usted podra descargar el manual detallado con graficos incluido en el repositorio )
- Configurar versión swift 2.3
- Importar frameworks
- Reconstruir el proyecto ( product > build )
- Agregar las librerías 
- Importar el framework dentro de una clase swift
- Agregar permisos al info.plist ( NSAppTransportSecurity > Allow Arbitrary Loads > yes )

## Clases Principales

La libreria esta dividida en 2 clases principales de las cuales pueden hacer llamada a funciones.

### BPCodes

Contiene la descripcion de los errores que se precenten al realizar los procesos para transaccionar.

#### Uso
```swift
import UIKit
import BPTNPFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(BPCodes().getCodeDescription(001));
    }

}
```
