//
//  CategoryFoodCollectionViewCell.swift
//  pizza
//
//  Created by Баэль Рыспеков on 2/4/23.
//

import UIKit

class CategoryFoodCollectionViewCell: UICollectionViewCell {
    
    
    private let food: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = Color.gray
        
        return label
    }()
    
    private let foodSize: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = Color.gray
        
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        

        contentView.addSubview(food)
        contentView.addSubview(foodSize)
        food.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        foodSize.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

    }
    
    func initData(name:String){
        food.text = name
    }
    
    func initDataSize (size:String){
        foodSize.text = size
    }
    
    
    
}
