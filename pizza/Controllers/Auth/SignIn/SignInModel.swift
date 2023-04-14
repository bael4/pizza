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
//    private var sc = SceneDelegate()
    
    
    init(controller: SignInController!) {
        self.controller = controller
    }
    
    
    func checkTF (tf: [UITextField]) {
        
        for e in tf {
            if e.text?.isEmpty ?? true {
               print("error")
            }else{
//                sc.window?.rootViewController = MainTabBarController()
            }
        }
       
    }
    
    
}
