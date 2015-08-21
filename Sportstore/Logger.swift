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
    var arrayQ = dispatch_queue_create("arrayQ", DISPATCH_QUEUE_CONCURRENT);
    
    
    init(callback:T -> Void) {
        self.callback = callback;
    }

//    func logItem(item:T) {
//        dataItems.append(item.copy() as! T);
//        callback(item);
//    }
    
    func logItem(item:T) {
        dispatch_barrier_async(arrayQ, {() in
            self.dataItems.append(item.copy() as! T);
            self.callback(item);
        });
    }
    
    func processItems(callback:T -> Void) {
        dispatch_sync(arrayQ, {() in
            for item in self.dataItems {
                callback(item);
            }
        });
    }
}