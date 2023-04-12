//
//  ViewController.swift
//  pizza
//
//  Created by Баэль Рыспеков on 2/4/23.
//

import UIKit
import SnapKit


//protocol


class HomeViewController: UIViewController {
    
    private var category: [String] = ["All","Pizza", "Fast Food", "Vegatarians"]
    private var food: [Food] = [
        Food(name: "Pizza with Mushrooms", time: "14-20 minutes", price: "$12", image: "pizza", details: Details(name: "Pizza with Mushrooms", image: "pizza2")),
        Food(name: "Pepperoni Cheese Pizza", time: "14-20 minutes", price: "$18", image: "pepperoni", details: Details(name: "Pepperoni Cheese Pizza", image: "pizza2")),
        Food(name: "Pizza with Mushrooms", time: "20-30 minutes", price: "$14", image: "pizza", details: Details(name: "Pizza with Mushrooms", image: "pizza2")),
        ]
   
    
 

    
       
    
    
    var productAmount = 0
    public var basketProducts: [Food] = []
    
    private let greeting: UILabel = {
        
        let label =  UILabel()
        label.textColor = Color.gray
        label.font = .systemFont(ofSize: 18)
        label.text = "Hello Bael"
        return label
        
    }()
    
    private let welcome: UILabel = {
        
        let label =  UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 32)
        label.text = "Welcome Back !"
        return label
        
    }()
    
    private let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder =  "Search"
        return sb
    }()
      
        
    private let notificationsImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "notifications")
        return image
    }()
    
    
    private let filterImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "filter")
        return image
    }()
    
    private let collectionFood: UICollectionView = {
           
           let view: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
           view.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
           view.itemSize = CGSize(width:100, height: 35)
           view.scrollDirection = .horizontal
           view.minimumLineSpacing = 30
        
        
           let vc = UICollectionView(frame: .zero, collectionViewLayout: view)
           vc.showsHorizontalScrollIndicator = false
        vc.register(CategoryFoodCollectionViewCell.self, forCellWithReuseIdentifier: CategoryFoodCollectionViewCell.reuseID)
        
           
           return vc
       }()
    
    private let collectionPizza: UICollectionView = {
           
           let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
           layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
           layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.9 , height: 184)
           layout.scrollDirection = .vertical
           layout.minimumLineSpacing = 30
        
        
           let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
           cv.showsVerticalScrollIndicator = false
           cv.register(FoodCollectionViewCell.self, forCellWithReuseIdentifier: FoodCollectionViewCell.reuseId)

           
           return cv
       }()
    
        private lazy var basketButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "basket.fill"), for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
        return button
            
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        constrains()
      
    }

    
    private func initUI(){
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
    [greeting, welcome, searchBar, notificationsImage, filterImage,collectionFood, collectionPizza, basketButton].forEach { box in
                   view.addSubview(box)
    }
        
        collectionFood.dataSource = self
        collectionPizza.dataSource = self
        collectionPizza.delegate = self
        
    }

    private func constrains () {

        greeting.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(54)
            make.leading.equalToSuperview().offset(24)
        }
            welcome.snp.makeConstraints { make in
                make.top.equalTo(greeting.snp.bottom).offset(10)
                make.leading.equalTo(greeting.snp.leading)
            }
             
            notificationsImage.snp.makeConstraints { make in
                make.top.equalTo(greeting)
                make.trailing.equalToSuperview().offset(-30)
            }
            
            searchBar.snp.makeConstraints { make in
                make.top.equalTo(welcome.snp.bottom).offset(36)
                make.leading.equalTo(greeting.snp.leading)
                make.trailing.equalTo(filterImage.snp.leading).offset(-25)
            }
                
            filterImage.snp.makeConstraints { make in
                make.top.equalTo(searchBar)
                make.trailing.equalToSuperview().offset(-24)
                make.width.height.equalTo(55)
            }
                
            collectionFood.snp.makeConstraints { make in
                
                    make.top.equalTo(searchBar.snp.bottom).offset(46)
                    make.trailing.leading.equalToSuperview().inset(0)
                    make.height.equalTo(50)
                }
        
            collectionPizza.snp.makeConstraints { make in
                
            make.top.equalTo(collectionFood.snp.bottom).offset(40)
            make.trailing.leading.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-200)
            
        }
        
        
        basketButton.snp.makeConstraints { make in
            make.top.equalTo(collectionPizza.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(100)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        

    }
    
    
    @objc func goToCart() {
     
       
        guard let tabBarController = self.tabBarController else { return }
        guard let cartVC = tabBarController.viewControllers?[2] as? CartViewController else { return }
        cartVC.food = basketProducts
        tabBarController.selectedIndex = 2
        
      
    
        
}
    


}


extension HomeViewController: UICollectionViewDataSource,  UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionFood {
            return category.count
        }else{
           return food.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionFood {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryFoodCollectionViewCell.reuseID ,for: indexPath) as! CategoryFoodCollectionViewCell
        
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            
            // shadow
            cell.layer.shadowColor = Color.shadow.cgColor
            cell.layer.shadowOpacity = 0.5
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowRadius = 5
            cell.layer.shadowPath = UIBezierPath(rect: cell.bounds).cgPath
            cell.layer.shouldRasterize = true
            cell.layer.masksToBounds = false
            cell.initData(name: category[indexPath.row])
            return cell
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCollectionViewCell.reuseId, for: indexPath) as! FoodCollectionViewCell
            cell.backgroundColor = .white
            cell.layer.cornerRadius = 10
            // shadow
            cell.layer.shadowColor = Color.shadow.cgColor
            cell.layer.shadowOpacity = 0.5
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.shadowRadius = 5
            cell.layer.shadowPath = UIBezierPath(rect: cell.bounds).cgPath
            cell.layer.shouldRasterize = true
            cell.layer.masksToBounds = false
            cell.indexPath = indexPath
            cell.delegate = self
            cell.initData(food: food[indexPath.row])
            return cell
        }
      
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let vc = DetailViewController()
         
        vc.foodName.text = food[indexPath.row].details.name
        vc.foodPrice.text = food[indexPath.row].price
        vc.foodImage.image = UIImage(named: food[indexPath.row].details.image)
        
        
         self.navigationController?.pushViewController(vc, animated: true)

        
     }
    
}


extension HomeViewController: CellActions {
    
    func didProudChose(index: Int) {
    productAmount += 1
        basketButton.setTitle("\(productAmount)", for: .normal)
        basketProducts.append(food[index])
        print(basketProducts)
    }
    
    
}
