//
//  BaseCollectionViewCell.swift
//  Unsplash
//
//  Created by Jorge Luis Rivera Ladino on 25/10/20.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        
    }

}
