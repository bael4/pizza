//
//  PizzaCollectionViewCell.swift
//  pizza
//
//  Created by Баэль Рыспеков on 2/4/23.
//

import UIKit


protocol CellActions: AnyObject {
    func didProudChose (index: Int)
        
    
    }


class FoodCollectionViewCell: UICollectionViewCell {
    
    
    weak var delegate: CellActions?
    
    var indexPath: IndexPath?

    static let reuseId = "collection_pizza"
    
    
    private let foodImage: UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: "pizza")
        return image
    }()
    
    private let food_name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
//        label.text = "Pizza with Mushrooms"
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
        label.font = .systemFont(ofSize: 12)
        label.textColor = Color.gray
//        label.text = "14-20 minutes"
        return label
    }()
    
    private let priceFood: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = Color.green
//        label.text = "$14"
        return label
    }()
  
    
    private let add: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("+", for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.black, for: .normal)

      
        button.layer.shadowColor = Color.shadow.cgColor
        button.layer.shadowOpacity = 5
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        [foodImage,add,food_name,timerImage, time, priceFood].forEach { box in
                    contentView.addSubview(box)
        }
        
        
        
        foodImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            
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
            make.bottom.equalToSuperview().offset(-16)
        }
        
        
        add.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-18)
            make.bottom.equalToSuperview().offset(-16)
            make.width.height.equalTo(40)
        }
        
       
        
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func addButtonTap () {
        delegate?.didProudChose(index: indexPath!.row)
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
