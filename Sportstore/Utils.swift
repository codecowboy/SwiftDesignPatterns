//
//  Utils.swift
//  Sportstore
//
//  Created by Luke Mackenzie on 15/08/2015.
//  Copyright © 2015 loopfruit. All rights reserved.
//

import Foundation

class Utils {
    
    /*
        static method
    */
    class func currencyStringFromNumber(number:Double) -> String {
        let formatter = NSNumberFormatter();
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle;
        return formatter.stringFromNumber(number) ?? "";
    }

}