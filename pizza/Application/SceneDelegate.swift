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
        
        let homeVC = HomeViewController()
        let tabBarItemHome = UITabBarItem(title: "Home", image: UIImage(named:"home"), selectedImage: UIImage(named: "home"))
        homeVC.tabBarItem = tabBarItemHome
        let homeNavigation = UINavigationController(rootViewController: homeVC)
        
        let favoriteVC = FavoriteViewController()
        let tabBarItemFavorite = UITabBarItem(title: "Favorite", image: UIImage(named:"favorite"), selectedImage: UIImage(named: "favorite"))
        favoriteVC.tabBarItem = tabBarItemFavorite
        
        let cartVC = CartViewController()
        let tabbarItemCart = UITabBarItem(title: "Cart", image: UIImage(named: "cart"), selectedImage: UIImage(named: "cart"))
        cartVC.tabBarItem = tabbarItemCart
        
        let ordersVC = MyOrdersViewController()
        let tabbarItemOrders = UITabBarItem(title: "My Orders", image: UIImage(named: "orders"), selectedImage: UIImage(named: "orders"))
        ordersVC.tabBarItem = tabbarItemOrders
        
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeNavigation, favoriteVC, cartVC, ordersVC]
        tabbarController.tabBar.backgroundColor = Color.black
       
        
        
        window.rootViewController = tabbarController
        self.window = window
        window.makeKeyAndVisible()
    }
}

