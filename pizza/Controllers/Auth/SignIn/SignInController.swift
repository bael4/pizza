//
//  File.swift
//  pizza
//
//  Created by Баэль Рыспеков on 13/4/23.
//

import Foundation



class SignInController {
    
    
    private weak var view: SignIn!
    private var model: SignInModel?
    
    init(view: SignIn) {
        self.view = view
        self.model = SignInModel(controller: self)
    }
    
    
    func check () {
//        model?.checkTF(tf: )
    }
    
}
