//
//  MainTabBarController.swift
//  pizza
//
//  Created by Баэль Рыспеков on 3/4/23.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: HomeViewController(),
                title: "Home",
                image: UIImage(named: "home")
            ),
            
            generateVC(
                viewController: FavoriteViewController(),
                title: "Favorite",
                image: UIImage(named: "favorite")
            ),
            
            generateVC(
                viewController: CartViewController(),
                title: "Cart",
                image: UIImage(named: "cart")
            ),
            
            generateVC(
                viewController: MyOrdersViewController(),
                title: "My Orders",
                image: UIImage(named: "orders")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        
        return viewController
    }
    
    private func setTabBarAppearance() {

        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width * 0.8
        let height = tabBar.bounds.height + positionOnY * 2
        
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: 40,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: 20
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemSpacing = 15
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.black.cgColor
        tabBar.tintColor = Color.orange
        tabBar.unselectedItemTintColor = Color.mainGray
    }
}
