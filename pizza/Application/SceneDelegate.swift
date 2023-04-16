//
//  SceneDelegate.swift
//  pizza
//
//  Created by Баэль Рыспеков on 2/4/23.
//

import UIKit


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    
    
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        self.setupWindow(with: scene)
        self.check()
    }
    
    
    private  func check () {
        
        //if Auth.auth.getRes() {

            let nav = UINavigationController(rootViewController:  SignIn() )
            self.window?.rootViewController = nav
            self.window?.backgroundColor = .white
//        }else{
//                    let nav = UINavigationController(rootViewController: MainTabBarController())
//                    self.window?.rootViewController = nav
//                    self.window?.backgroundColor = .white
//        }
        

    }
    
    private func setupWindow(with scene: UIScene){
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        self.window?.makeKeyAndVisible()
    }
    
}

