# Blumon Pay Tarjeta No Presente IOS API

SDK para integración de pagos electronicos en su propia aplicacion ios swift 2.3
Para transaccionar en produccion con Blumon Pay se requiere de solicitar una alta de usuario al correo: helloworld@blumonpay.com

## Archivos del Repositorio
BPTNPFDevConDemoSwift23 -> Proyecto de ejemplo version en consola para xcode swift 2.3
BPTNPFDevDemoSwift23 -> Proyecto de ejemplo version grafica para xcode swift 2.3
swift 2.3 Final Dev BPCore -> Los 2 framework necesarios para transaccionar (BPFramework y CryptoSwift)
Framework Tarjeta No Presente IOS.docx -> Manual detallado del uso del framework


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

Contiene la descripcion de los errores que se precenten al realizar los procesos para transaccionar; Basta con poner como parametro la respuesta de los metodos de transaccion y este dara el error o codigo esperado.
Lista completa de codigos en el manual incluido en el repositorio.

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
### RequestBPC

Contiene las funciones necesarias para realizar el proceso de transaccion, asi como las respuestas obtenidas.
Ejemplo de transaccion completa en consola ( la lista de funciones detalladas podra encontrarlo en el manual incluido en el repositorio).

### Uso
```swift
import UIKit
import BPTNPFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Borrar sesiones en caso de que otro dispositivo use el mismo proceso con el mismo usuario.
        RequestBPC().requestClearSessionLogin();
        
        let requestLogin = RequestBPC().requestLogin("pruebasIOSTNP", password: "pruebasIOSTNP", serial: "777-555-333");
        
        if requestLogin == 004 || requestLogin == 007 {
            // Esto indica que el proceso de login fue realizado correctamente.
            // Ahora podemos realizar la transaccion
            let requestTransaction = RequestBPC().requestTransaction("1", cardNumber: "1234567891234567", cardMonth: "10", cardYear: "16", cardMember: "Sergi Mejia R.", currency: "MXN", concepts: "Compra de Laptop", address: "Haciendas 123", amount: 15.300, phone: "5566223344", zipCode: "02410", CVV: "123");
            
            if requestTransaction == 016 {
                // Esto indica que el proceso de transaccion fue realizado correctamente
                // Usted podra mostrar mensaje de operacion correcta y otorgar valores de respuesta
                print("Pago Exitoso");
                print(RequestBPC().requestTransaccionResponseData().valueForKey("transactionId"));
                print(RequestBPC().requestTransaccionResponseData().valueForKey("reference"));
            }else{
                // Fallo la transaccion e imprimimos el error
                print(BPCodes().getCodeDescription(requestTransaction));
            }
            
        }else{
            // Fallo el inicio de sesion e imprimimos el error.
            print(BPCodes().getCodeDescription(requestLogin));
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
```
