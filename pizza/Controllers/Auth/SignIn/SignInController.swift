//
//  File.swift
//  pizza
//
//  Created by Баэль Рыспеков on 13/4/23.
//

import Foundation
import UIKit


class SignInController {
    
    
    private weak var view: SignIn!
    private var model: SignInModel?

    
    init(view: SignIn) {
        self.view = view
        self.model = SignInModel(controller: self)
     
    }
    
    func checkController (email: UITextField, password: UITextField) -> Bool  {
        
        return ((model?.check(email: email, password: password))!)
    }
  
    
}
