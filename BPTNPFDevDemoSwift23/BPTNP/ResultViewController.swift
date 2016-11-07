//
//  ResultViewController.swift
//  BPTNP
//
//  Created by Blumon Pay on 10/18/16.
//  Copyright © 2016 Blumon Pay. All rights reserved.
//

import UIKit
import BPTNPFramework

class ResultViewControlller: UIViewController {
    
    @IBOutlet weak var lblConcept: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblReference: UILabel!
    @IBOutlet weak var lblTransactionId: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // print(RequestBPC().requestLoginSessionData());
        setResponseData();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setResponseData(){
        lblConcept.text = "Concept: "+SingletonModel.singletonModel.getNameItemToBuy();
        lblAmount.text = "Amount: "+String(RequestBPC().requestTransaccionResponseData().valueForKey("amount") as! String);
        lblReference.text = "Reference: "+String(RequestBPC().requestTransaccionResponseData().valueForKey("reference") as! String);
        lblTransactionId.text = "Transaction ID: "+String(RequestBPC().requestTransaccionResponseData().valueForKey("transactionId") as! String);
    }
    @IBAction func purchaseEND(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil);
        /*
            let navigationView = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewControlller
            self.presentViewController(navigationView, animated: true, completion: nil);
        */
    }
 
}
