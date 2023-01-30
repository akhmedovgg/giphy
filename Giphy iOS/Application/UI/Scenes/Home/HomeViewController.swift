//
//  HomeViewController.swift
//  Giphy
//
//  Created by Sherzod Akhmedov on 28/01/23.
//

import UIKit
import Kingfisher

class HomeViewController: ViewController<HomeView> {
    
    private let presenter: HomeViewToPresenterProtocol
    
    private var imageCollection: [ImageCollection] = [] {
        didSet {
            images = imageCollection.flatMap({ $0.fixedHeightDownsampled })
        }
    }
    private var images: [Image] = []
    
    required init(presenter: HomeViewToPresenterProtocol, nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil) {
        self.presenter = presenter
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.collectionView.delegate = self
        rootView.collectionView.dataSource = self
        if let mosaicLayout = rootView.collectionView.collectionViewLayout as? MosaicLayout {
            mosaicLayout.delegate = self
        }
        presenter.fetchTrendingGifs(pageSize: 20)
    }
}


extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard !images.isEmpty else { return }
        presenter.presentImageDetails(images[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard !images.isEmpty else { return }
        
        if indexPath.row == images.count - 1 {
            presenter.fetchTrendingGifs(pageSize: 20)
        }
    }
}

extension HomeViewController: MosaicLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath) -> CGFloat {
        guard !images.isEmpty else {
            return CGFloat.random(in: 50...200)
        }
        
        return images[indexPath.row].height
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard !images.isEmpty else {
            return 300
        }
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.reusableIdentifier, for: indexPath) as! GridCell
        
        if !images.isEmpty {
            cell.setImage(images[indexPath.row].url)
        }
        
        return cell
    }
}

extension HomeViewController: HomePresenterToViewProtocol {
    func displayTrendingGifs(_ imageCollection: ImageCollection) {
        self.imageCollection.append(imageCollection)
        self.rootView.collectionView.reloadSections(IndexSet(integer: 0))
    }
}
