//
//  PhotoListHomeViewModel.swift
//  Unsplash
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import Foundation

class PhotoListHomeViewModel {
    
    let photos = Observable<[Photo]>()
    let error = Observable<String>()
    let showProgress = Observable<Bool>()
        
    var photosCount: Int {
        return photos.property?.count ?? 0
    }
    
    init() {
        getPhotos()
    }
    
    func getPhoto(at indexPathRow: Int) -> Photo? {
        return photos.property?[indexPathRow]
    }
    
    private func getPhotos() {
        showProgress.property = true
        PhotoListHomeRepository().getPhotos { [weak self] resul in
            switch resul {
            case .success(response: let photos):
                self?.photos.property = photos as? [Photo]
            case .error(error: let error):
                self?.error.property = error
            }
        }
    }

}
