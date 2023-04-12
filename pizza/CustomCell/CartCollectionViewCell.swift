//
//  CartCollectionViewCell.swift
//  pizza
//
//  Created by Баэль Рыспеков on 12/4/23.
//

import UIKit



class CartCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "collection_cart"
    
    
    
    private let foodImage: UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: "pizza")
        return image
    }()
    
     let food_name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let timerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Timer")
        return image
    }()
    
    private let time: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 8)
        label.textColor = Color.gray
        return label
    }()
    
    private let priceFood: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = Color.green
        return label
    }()
  
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        [foodImage,food_name,timerImage, time, priceFood].forEach { box in
                    contentView.addSubview(box)
        }
        
        
        
        foodImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.height.equalTo(100)
            
        }
        
        food_name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(foodImage.snp.trailing)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        timerImage.snp.makeConstraints { make in
            make.top.equalTo(food_name.snp.bottom).offset(14)
            make.leading.equalTo(foodImage.snp.trailing)
        }
        
        time.snp.makeConstraints { make in
            make.centerY.equalTo(timerImage)
            make.leading.equalTo(timerImage.snp.trailing).offset(8)
        }
        
        
        priceFood.snp.makeConstraints { make in
            make.leading.equalTo(foodImage.snp.trailing)
            make.bottom.equalToSuperview()
        }
        
        
       
        
       
        
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

 
    
    override func prepareForReuse() {
        super.prepareForReuse()

    }
    
 
    func initData (food:Food){
        food_name.text = food.name
        time.text = food.time
        foodImage.image = UIImage(named: food.image)
        priceFood.text = food.price
        
    }
 
    
    
    
}
