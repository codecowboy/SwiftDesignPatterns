//
//  Logger.swift
//  Sportstore
//
//  Created by Luke Mackenzie on 19/08/2015.
//  Copyright © 2015 loopfruit. All rights reserved.
//

import Foundation

class Logger<T where T:NSObject, T:NSCopying> {
    
    var dataItems:[T] = [];
    var callback:(T) -> Void;
    
    init(callback:T -> Void) {
        self.callback = callback;
    }

    func logItem(item:T) {
        dataItems.append(item.copy() as! T);
        callback(item);
    }
    
    func processItems(callback:T -> Void) {
        for item in dataItems {
            callback(item);
        }
    }
}