//
//  GalleriesCollectionViewController.swift
//  ArtGallery
//
//  Created by Andreea Lavinia Ionescu on 06/02/2020.
//  Copyright © 2020 Orange Labs Romania. All rights reserved.
//

import UIKit

private let reuseIdentifier = "GalleryCollectionViewCell"

class GalleriesCollectionViewController: UICollectionViewController {

    var viewModel: GalleryCollectionViewModel = GalleryCollectionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.createMockData()
        collectionView.reloadData()
    }
}

// MARK: UICollectionViewDataSource
extension GalleriesCollectionViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.levelsList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? GalleryCollectionViewCell
        guard let customCell = cell,
              indexPath.row < viewModel.levelsList.count else {
            return UICollectionViewCell()
        }
        // Configure the cell
        let gallery = viewModel.levelsList[indexPath.row]
        customCell.configureCollectionCell(for: gallery)
        
        return customCell
    }
}

// MARK: UICollectionViewDelegate
extension GalleriesCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let galleryInfo: GalleryModel = viewModel.levelsList[indexPath.row]
        print("Selected Gallery: \(galleryInfo.name)")
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension GalleriesCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = (UIScreen.main.bounds.width - 10.0) / 2
        return CGSize(width: side, height: side)
    }
}
