//
//  ViewController.swift
//  pizza
//
//  Created by Баэль Рыспеков on 2/4/23.
//

import UIKit
import SnapKit


class HomeViewController: UIViewController {
    
    private var category: [String] = []
    private var pizza: [Pizza] = []
    private let idCell = "cell"
    
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
           vc.register(CategoryFoodCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
           
           return vc
       }()
    
    private let collectionPizza: UICollectionView = {
           
           let view: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
           view.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        view.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.9 , height: 184)
           view.scrollDirection = .vertical
           view.minimumLineSpacing = 30
        
        
           let vc = UICollectionView(frame: .zero, collectionViewLayout: view)
           vc.showsVerticalScrollIndicator = false
           vc.register(PizzaCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
           
           return vc
       }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        initData()
        constrains()
      
    }

    
    private func initUI(){
        
        view.backgroundColor = .white
    [greeting, welcome, searchBar, notificationsImage, filterImage,collectionFood, collectionPizza].forEach { box in
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
            make.bottom.equalToSuperview().offset(-100)
            
        }
        

    }
    
    private func initData () {
        category = ["All","Pizza", "Fast Food", "Vegatarians"]
        pizza = [
        Pizza(name: "Pizza with Mushrooms", time: "14-20 minutes", price: "$12", image: "pizza", details: Details(name: "Pizza with Mushrooms", image: "pizza2")),
        Pizza(name: "Pepperoni Cheese Pizza", time: "14-20 minutes", price: "$18", image: "pepperoni", details: Details(name: "Pepperoni Cheese Pizza", image: "pizza2")),
        Pizza(name: "Pizza with Mushrooms", time: "20-30 minutes", price: "$14", image: "pizza", details: Details(name: "Pizza with Mushrooms", image: "pizza2")),
        ]
    }

}


extension HomeViewController: UICollectionViewDataSource,  UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionFood {
            return category.count
        }else{
           return pizza.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionFood {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell, for: indexPath) as! CategoryFoodCollectionViewCell
        
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
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell, for: indexPath) as! PizzaCollectionViewCell
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
            cell.initData(name: pizza[indexPath.row].name, timer:pizza[indexPath.row].time , image: pizza[indexPath.row].image, price:pizza[indexPath.row].price)
            return cell
        }
      
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let vc = DetailViewController()
         
        vc.foodName.text = pizza[indexPath.row].details.name
        vc.foodPrice.text = pizza[indexPath.row].price
        vc.foodImage.image = UIImage(named: pizza[indexPath.row].details.image)
        
        
         self.navigationController?.pushViewController(vc, animated: true)

        
     }
    
}


