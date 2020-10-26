//
//  PhotoHomeViewModel.swift
//  Unsplash
//
//  Created by Jorge Luis Rivera Ladino on 25/10/20.
//

import Foundation

class PhotoHomeViewModel {
    
    private var photo: Photo?
    
    init(photo: Photo?) {
        self.photo = photo
    }
    
    var likes: String {
        return String(photo?.likes ?? 0)
    }
    
    var image: String? {
        return photo?.urls?.regular // photo?.urls?.full
    }
    
    var userName: String {
        return photo?.user?.name ?? ""
    }
    
    var userImage: String? {
        return photo?.user?.profileImage?.medium
    }

}
