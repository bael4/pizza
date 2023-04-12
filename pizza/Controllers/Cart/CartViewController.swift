//
//  CartViewController.swift
//  pizza
//
//  Created by Баэль Рыспеков on 2/4/23.
//

import UIKit

class CartViewController: UIViewController {
  
    
    
    
    
    

    
    
    var food: [Food] = []
    
    private lazy var cartCollection: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width * 0.5  , height: UIScreen.main.bounds.height * 0.1)
        layout.scrollDirection = .horizontal
        
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .systemGreen
        view.showsHorizontalScrollIndicator = false
        view.dataSource = self
        view.backgroundColor = .systemGreen
        view.register(CartCollectionViewCell.self, forCellWithReuseIdentifier: CartCollectionViewCell.reuseId)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
           
        setupSubViews()
    
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            cartCollection.reloadData()
        }
    
    
    private func setupSubViews () {
        view.backgroundColor = .white
      
        
        view.addSubview(cartCollection)
        
        cartCollection.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height * 0.2)
        }
    }
    
    
    
}



extension CartViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        food.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartCollectionViewCell.reuseId, for: indexPath) as! CartCollectionViewCell
     
        
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
        
        cell.initData(food: food[indexPath.row])
      
        
        return cell
    }
    
    
}
