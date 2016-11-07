//
//  ViewController.swift
//  BPTNP
//
//  Created by Blumon Pay on 10/14/16.
//  Copyright © 2016 Blumon Pay. All rights reserved.
//

import UIKit
import BPTNPFramework

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        RequestBPC().requestClearSessionLogin();

        print("sesion es vacia: \(RequestBPC().requestKnowIfSessionLoginIsEmpty())");
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

