//
//  PhotosHomeViewController.swift
//  Unsplash
//
//  Created by Jorge Luis Rivera Ladino on 23/10/20.
//

import UIKit

class PhotosHomeViewController: UIViewController {
    
    let viewModel = PhotoListHomeViewModel()
    
    let photosTableView = InitView(UITableView()) {
        $0.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupTableView()
        setupBindings() 
    }
    
    private func addSubviews() {
        photosTableView.fixInView(view)
    }
    
    private func setupBindings() {
        viewModel.showProgress.bind { show in
            print(show)
        }
        
        viewModel.photos.bind { [weak self] _ in
            self?.photosTableView.reloadData()
        }
        
        viewModel.error.bind { error in
            print(error)
        }
    }
    
    private func setupTableView() {
        photosTableView.register(PhotoHomeViewCell.self, forCellReuseIdentifier: "cell")
        photosTableView.delegate = self
        photosTableView.dataSource = self
    }

}
