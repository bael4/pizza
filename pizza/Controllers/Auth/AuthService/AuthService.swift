//
//  AuthService.swift
//  pizza
//
//  Created by Баэль Рыспеков on 14/4/23.
//

import Foundation


 class Auth {
     
     static var auth = Auth()
     private var isAuth = false
     
     func succes ()  {
        isAuth = true
     }
     
    
     
     func getRes () -> Bool {
         return isAuth
     }
     
     
     
}


class Counter {
    static let shared = Counter()
    private var count = 0
    
    private init() {}
    
    func increment() {
        count += 1
    }
    
    func decrement() {
        count -= 1
    }
    
    func reset() {
        count = 0
    }
    
    func getCount() -> Int {
        return count
    }
}
