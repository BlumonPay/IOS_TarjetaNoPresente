//
//  ViewController.swift
//  BPTNPFDevConDemoSwift23
//
//  Created by Blumon Pay on 10/28/16.
//  Copyright © 2016 Blumon Pay. All rights reserved.
//

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

