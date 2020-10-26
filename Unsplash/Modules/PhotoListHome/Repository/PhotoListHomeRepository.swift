//
//  PhotoListHomeRepository.swift
//  Unsplash
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import UIKit

class PhotoListHomeRepository {
    
    func getPhotos(completion: RepositoryResultBlock) {
        let parameters = [
            "client_id": "fiGoeK_glvdkyfDbta1ORVAdtm1oTSFI7tIXw3rM3NU"
        ]
        
        APIManager.request(service: .Photos(parameters)) { (result: ServiceResultWithEntity<[Photo], ErrorResponse>) in
            
            switch result {
            case .success(response: let photos):
                completion?(.success(response: photos))
            case.errorResult(entity: let entity):
                completion?(.error(error: entity.error))
            case .error(error: let error):
                completion?(.error(error: error.localizedDescription))
            }
        }
    }

}
