//
//  CatalogViewController.swift
//  BPTNP
//
//  Created by Blumon Pay on 10/14/16.
//  Copyright © 2016 Blumon Pay. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    let arrayProducts : [String] = ["Toshiba PW-55","MAC Book Pro","HP Proo Book"];
    let arrayImageProducts : [String] = ["toshiba","mac","toshiba"];
    let arrayPriceProducts : [Float] = [15000,1.01,9.99];
    let arrayDescProducts : [String] = [
        "Computadora especial de trabajo lijero y uso de tablet",
        "Compuradora MAC de trabajo intermedio con usos especiales",
        "Compuradora para uso rudo de trabajo de alto rendimiento"
    ]
    
    
    @IBOutlet weak var imageViewProductDetail: UIImageView!
    @IBOutlet weak var nameProductDetail: UILabel!
    @IBOutlet weak var priceProductDetail: UILabel!
    @IBOutlet weak var descriptionProductDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.layer.borderWidth = 0.5;
        self.tableView.backgroundColor = UIColor.whiteColor();
        imageViewProductDetail.image = UIImage(named: "placeholder");
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func openPayNavigationController(sender: UIButton) {
        if !validateItemToBuyIsEmpty() {
            let controllerView = self.storyboard?.instantiateViewControllerWithIdentifier("PayController") as! PayViewController
            self.presentViewController(controllerView, animated: true, completion: nil);
        }else{
            showAlert("You Should Select One PC First");
        }
        
    }
    
    private func validateItemToBuyIsEmpty() ->Bool{
        if SingletonModel.singletonModel.getNameItemToBuy().isEmpty {
            return true;
        }else if SingletonModel.singletonModel.getPriceItemToBuy() == 0 {
            return true;
        }else{
            return false;
        }
    }
    
    private func showAlert(messageAlert : String){
        // create the alert
        let alert = UIAlertController(title: "Aviso", message: messageAlert, preferredStyle: UIAlertControllerStyle.Alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayProducts.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = arrayProducts[indexPath.row];
        cell.detailTextLabel?.text = "$ \(arrayPriceProducts[indexPath.row])";
        cell.imageView?.image = UIImage(named: arrayImageProducts[indexPath.row]);
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        imageViewProductDetail.image = UIImage(named: arrayImageProducts[indexPath.row]);
      //  nameProductDetail.text = arrayProducts[indexPath.row];
      //  descriptionProductDetail.text = arrayDescProducts[indexPath.row];
      //  priceProductDetail.text = "\(arrayPriceProducts[indexPath.row])";
        
        setValuesOfItemsToBuySingleton(indexPath.row);
    }
    
    
    
    func tableView(tableView: UITableView, heightForRowAt indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAt indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    private func setValuesOfItemsToBuySingleton(index : Int){
        SingletonModel.singletonModel.setNameItemToBuy(arrayProducts[index]);
        SingletonModel.singletonModel.setPriceItemToBuy(arrayPriceProducts[index]);
    }


}
