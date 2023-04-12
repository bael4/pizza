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
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        

        
        let navigation = UINavigationController(rootViewController:  MainTabBarController())
        
        window.rootViewController = navigation
        self.window = window
        window.makeKeyAndVisible()
    }
}

