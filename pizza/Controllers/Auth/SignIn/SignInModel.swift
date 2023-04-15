//
//  SignInModel.swift
//  pizza
//
//  Created by Баэль Рыспеков on 13/4/23.
//

import Foundation
import UIKit






class SignInModel {
    
    private weak var controller: SignInController!

    
    init(controller: SignInController!) {
        self.controller = controller
    }
    
   
    func check (email: UITextField, password: UITextField) -> Bool {
        
        if email.text?.isEmpty ?? true || password.text?.isEmpty ?? true {
            return true
        }else {
            return false
        }
        
    }
    
    
}
