//
//  DetailViewController.swift
//  pizza
//
//  Created by Баэль Рыспеков on 2/4/23.
//

import UIKit

class DetailViewController: UIViewController {

    
    private let idCell = "cell"
    private var sizeFood: [String] = []
    var foodName: UILabel = {
        
        let label =  UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 38)
//        label.text = "Pizza with Mushrooms"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
        
    }()
    
    
    var foodImage: UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: "pizza2")
        return image
    }()
    
    
    
    private let size: UILabel = {
        
        let label =  UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 22)
        label.text = "Choose the size"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
        
    }()
    
    
    private let collectionSize: UICollectionView = {
           
           let view: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
           view.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
           view.itemSize = CGSize(width:100, height: 35)
           view.scrollDirection = .horizontal
           view.minimumLineSpacing = 50
        
        
           let vc = UICollectionView(frame: .zero, collectionViewLayout: view)
           vc.showsHorizontalScrollIndicator = false
           vc.register(CategoryFoodCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
           
           return vc
       }()
    
    
    private let addingView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.mainGray
        view.layer.cornerRadius = 15
        return view
    }()
    
    
    private let count: UILabel  = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 22)
        label.text = "01"
        return label
    }()
    
    private let plus: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let minus: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    private let price: UILabel  = {
        let label = UILabel()
        label.textColor = Color.gray
        label.font = .systemFont(ofSize: 16)
        label.text = "Price"
        return label
    }()
    
        var foodPrice: UILabel  = {
        let label = UILabel()
        label.textColor = Color.green
        label.font = .boldSystemFont(ofSize: 28)
//        label.text = "Price"
        return label
    }()
    
    
    private let addButton: UIButton = {
        
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Add to Cart", for: .normal)
        button.backgroundColor = Color.orange
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        return button
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        initData()
        constrains()
        
    }
    
    private func initUI (){
      
        view.backgroundColor = .white
        navigationItem.title = "Detail"

        let heartImage = UIImage(named: "favorite")
        let heartButton = UIButton(type: .custom)
        heartButton.setImage(heartImage, for: .normal)
        heartButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let heartBarButton = UIBarButtonItem(customView: heartButton)
        heartButton.tintColor = UIColor.red
        navigationItem.rightBarButtonItem = heartBarButton

        collectionSize.dataSource = self
        [foodName,foodImage,size,collectionSize, addingView, price, foodPrice, addButton].forEach { box in
                       view.addSubview(box)
        }
        [count,plus,minus].forEach { box in
                       addingView.addSubview(box)
        }
        

    }
    
    
    private func constrains (){
        foodName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.trailing.equalToSuperview().inset(112)
        }
        
        foodImage.snp.makeConstraints { make in
            make.top.equalTo(foodName.snp.bottom).offset(35)
            make.leading.trailing.equalToSuperview().inset(67)
        }
        
        
        size.snp.makeConstraints { make in
            make.top.equalTo(foodImage.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(100)
        }
        
        collectionSize.snp.makeConstraints { make in
            make.top.equalTo(size.snp.bottom).offset(43)
            make.trailing.leading.equalToSuperview().inset(0)
            make.height.equalTo(50)
        }
        
        addingView.snp.makeConstraints { make in
            make.top.equalTo(collectionSize.snp.bottom).offset(40)
            make.trailing.leading.equalToSuperview().inset(97)
            make.height.equalTo(70)
        }
        
        minus.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
        }
        
        count.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        
        plus.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-30)
        }
        
        price.snp.makeConstraints { make in
            make.top.equalTo(addingView.snp.bottom).offset(66)
            make.leading.equalToSuperview().offset(26)
        }
        
        foodPrice.snp.makeConstraints { make in
            make.top.equalTo(price.snp.bottom)
            make.leading.equalTo(price)
        }
        
        addButton.snp.makeConstraints { make in
            make.centerY.equalTo(foodPrice)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(60)
            make.width.equalTo(200)
        }
        
        
        
    }
    
    
    
    private func initData (){
        
        sizeFood = [
        "8 inch",  "20 inch",  "32 inch",
        ]
    }
   
    
  

}


extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sizeFood.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
        
        cell.initDataSize(size: sizeFood[indexPath.row])
        return cell
    }
    
    
}
