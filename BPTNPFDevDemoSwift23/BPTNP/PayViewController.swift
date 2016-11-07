//
//  PayViewController.swift
//  BPTNP
//
//  Created by Blumon Pay on 10/17/16.
//  Copyright © 2016 Blumon Pay. All rights reserved.
//

import UIKit
import BPTNPFramework

class PayViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textNumberCard: UITextField!
    @IBOutlet weak var textMonth: UITextField!
    @IBOutlet weak var textYear: UITextField!
    @IBOutlet weak var textCVV: UITextField!

    @IBOutlet weak var textNameOfCardMember: UITextField!
    @IBOutlet weak var textAddress: UITextField!
    @IBOutlet weak var textZipCode: UITextField!
    @IBOutlet weak var textPhone: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textNumberCard.delegate = self;
        textMonth.delegate = self;
        textYear.delegate = self;
        textCVV.delegate = self;
        textNameOfCardMember.delegate = self;
        textAddress.delegate = self;
        textZipCode.delegate = self;
        textPhone.delegate = self;
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func openBuyFInished(sender: UIButton) {
        setSingletonModel();
        if !validateIfDataIsEmpty() {
    
            /* start functions that request to pepe */
            activityIndicator.startAnimating();
            dispatch_async(dispatch_get_global_queue(Int(QOS_CLASS_USER_INITIATED.rawValue), 0)) {
                
                self.startBuyOperation();
                
                //Do your post code here or call the post func
                dispatch_async(dispatch_get_main_queue()) {
                    self.activityIndicator.stopAnimating()
                }
            }

        }
    }
    
    private func startBuyOperation(){
        
       
        let requestResponse : Int = RequestBPC().requestLogin("pruebasIOSTNP", password:"pruebasIOSTNP", serial: "777-555-333");
        if requestResponse == 004 || requestResponse == 007 {
            
            let requestTransactionResponse : Int = RequestBPC().requestTransaction("1",cardNumber: SingletonModel.singletonModel.getNumberCard(),cardMonth: SingletonModel.singletonModel.getMonth(),cardYear: SingletonModel.singletonModel.getYear(),cardMember: SingletonModel.singletonModel.getNameOfCardMember(), currency: "MXN", concepts: SingletonModel.singletonModel.getNameItemToBuy(), address: SingletonModel.singletonModel.getAddress(), amount: SingletonModel.singletonModel.getPriceItemToBuy(), phone: SingletonModel.singletonModel.getPhone(), zipCode: SingletonModel.singletonModel.getZipCode(),CVV: SingletonModel.singletonModel.getCVV());
            if requestTransactionResponse == 016 {
                print("reqtran: \(RequestBPC().requestTransaccionResponseData())");
                dispatch_async(dispatch_get_main_queue()){
                   // self.showAlert(BPCodes().getCodeDescription(requestTransactionResponse));
                    let navigationView = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewControlller
                    self.presentViewController(navigationView, animated: true, completion: nil);
                }
            }else{
                dispatch_async(dispatch_get_main_queue()){
                    self.showAlert(BPCodes().getCodeDescription(requestTransactionResponse));
                }
            }

        }else{
            dispatch_async(dispatch_get_main_queue()){
                self.showAlert(BPCodes().getCodeDescription(requestResponse));
            }
        }
    }
    
    
    private func validateIfDataIsEmpty() -> Bool{
        if SingletonModel.singletonModel.getNameItemToBuy().isEmpty {
            showAlert("Empty name of item to buy");
            return true;
        }else if SingletonModel.singletonModel.getPriceItemToBuy() == 0{
            showAlert("Empty Price of item to buy");
            return true;
        }else if SingletonModel.singletonModel.getNumberCard().isEmpty{
            showAlert("Empty number card");
            return true;
        }else if SingletonModel.singletonModel.getMonth().isEmpty{
            showAlert("Empty month");
            return true;
        }else if SingletonModel.singletonModel.getYear().isEmpty{
            showAlert("Empty year");
            return true;
        }else if SingletonModel.singletonModel.getCVV().isEmpty{
            showAlert("Empty CVV");
            return true;
        }else if SingletonModel.singletonModel.getNameOfCardMember().isEmpty{
            showAlert("Empty name of card member");
            return true;
        }else if SingletonModel.singletonModel.getAddress().isEmpty{
            showAlert("Empty address");
            return true;
        }else if SingletonModel.singletonModel.getZipCode().isEmpty{
            showAlert("Empty zipcode");
            return true;
        }else if SingletonModel.singletonModel.getPhone().isEmpty{
            showAlert("Empty phone");
            return true;
        }else{
            return false;
        }
            
    }
    
    @objc func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case textNumberCard:
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 16
        case textMonth:
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 2
        case textYear:
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 2
        case textCVV:
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 4
        case textNameOfCardMember:
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 50
        case textAddress:
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 50
        case textZipCode:
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 5
        case textPhone:
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 20
        default:
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength == 0;
        }
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("sale");
        self.view.endEditing(true)
        return false
    }
    
    private func setSingletonModel(){
        SingletonModel.singletonModel.setNumberCard(textNumberCard.text!);
        SingletonModel.singletonModel.setMonth(textMonth.text!);
        SingletonModel.singletonModel.setYear(textYear.text!);
        SingletonModel.singletonModel.setCVV(textCVV.text!);
        SingletonModel.singletonModel.setNameOfCardMember(textNameOfCardMember.text!);
        SingletonModel.singletonModel.setAddress(textAddress.text!);
        SingletonModel.singletonModel.setZipCode(textZipCode.text!);
        SingletonModel.singletonModel.setPhone(textPhone.text!);
    }
    
    private func showAlert(messageAlert : String){
        // create the alert
        let alert = UIAlertController(title: "Aviso", message: messageAlert, preferredStyle: UIAlertControllerStyle.Alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func goBackController(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil);
    }

}
