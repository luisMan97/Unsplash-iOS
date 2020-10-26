//
//  PhotosHomeViewControllerExtensions.swift
//  Unsplash
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import UIKit

extension PhotosHomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension PhotosHomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.photosCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PhotoHomeViewCell else {
                return UITableViewCell()
        }
        
        cell.viewModel = PhotoHomeViewModel(photo: viewModel.getPhoto(at: indexPath.row))
        
        return cell
    }
    
}
