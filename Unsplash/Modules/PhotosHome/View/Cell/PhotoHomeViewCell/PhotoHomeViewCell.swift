//
//  PhotoHomeViewCell.swift
//  Unsplash
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import UIKit

class PhotoHomeViewCell: BaseTableViewCell {
    
    var viewModel: PhotoHomeViewModel! {
        didSet {
            setup()
        }
    }
    
    var photoImage = InitView(CustomImageView()) {
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .lightGray
    }
    
    var nameLabel = InitView(UILabel()) {
        $0.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        $0.numberOfLines = 0
        $0.textColor = .black
    }
    
    var likesLabel = InitView(UILabel()) {
        $0.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        $0.textColor = .black
    }
    
    let separatorView = InitView(UIView()) {
        $0.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    }
    
    override func setupSubviews() {
        addSubview(photoImage)
        addSubview(nameLabel)
        
        photoImage.fixInViewWithAnchor(self, top: self.topAnchor, bottom: nameLabel.topAnchor, left: self.leftAnchor, right: self.rightAnchor/*, height: 170*/)
        nameLabel.fixInViewWithAnchor(self, bottom: self.bottomAnchor, paddingBottom: 8, left: self.leftAnchor, paddingLeft: 8, right: self.rightAnchor, paddingRight: 8)
    }
    
    private func setup() {
        nameLabel.text = viewModel.userName
        likesLabel.text = viewModel.likes
        
        setupPhotoImage()
    }
    
    private func setupPhotoImage() {
        if let imageUrl = viewModel.image {
            photoImage.loadImageUsingUrlString(urlString: imageUrl)
        }
    }

}
