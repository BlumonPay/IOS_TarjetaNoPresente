//
//  SingletonModel.swift
//  BPTNP
//
//  Created by Blumon Pay on 10/17/16.
//  Copyright © 2016 Blumon Pay. All rights reserved.
//

import Foundation
final class SingletonModel {
    static let singletonModel = SingletonModel();
    
    /* atributes */
    private var nameItemToBuy : String = "";
    private var priceItemToBuy : Float = 0;
    
    private var numberCard : String = "";
    private var month : String = "";
    private var year : String = "";
    private var CVV : String = "";
    private var nameOfCardMember : String = "";
    private var address : String = "";
    private var zipCode : String = "";
    private var phone : String = "";
    
    
    /* SETS */
    internal func setNameItemToBuy(nameItemToBuy : String){
        self.nameItemToBuy = nameItemToBuy;
    }
    internal func setPriceItemToBuy(priceItemToBuy : Float){
        self.priceItemToBuy = priceItemToBuy;
    }
    internal func setNumberCard(numberCard : String){
        self.numberCard = numberCard;
    }
    internal func setMonth(month : String){
        self.month = month;
    }
    internal func setYear(year : String){
        self.year = year;
    }
    internal func setCVV(CVV : String){
        self.CVV = CVV;
    }
    internal func setNameOfCardMember(nameOfCardMember : String){
        self.nameOfCardMember = nameOfCardMember;
    }
    internal func setAddress(address : String){
        self.address = address;
    }
    internal func setZipCode(zipCode : String){
        self.zipCode = zipCode;
    }
    internal func setPhone(phone : String){
        self.phone = phone;
    }
    
    
    /* GETS */
    internal func getNameItemToBuy() -> String{
        return self.nameItemToBuy;
    }
    internal func getPriceItemToBuy() -> Float{
        return self.priceItemToBuy;
    }
    internal func getNumberCard() -> String{
        return self.numberCard;
    }
    internal func getMonth() -> String{
        return self.month;
    }
    internal func getYear() -> String{
        return self.year;
    }
    internal func getCVV() -> String{
        return self.CVV;
    }
    internal func getNameOfCardMember() -> String{
        return self.nameOfCardMember;
    }
    internal func getAddress() -> String{
        return self.address;
    }
    internal func getZipCode() -> String{
        return self.zipCode;
    }
    internal func getPhone() -> String{
        return self.phone;
    }
}
