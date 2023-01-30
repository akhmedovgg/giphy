//
//  HomeView.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 28/01/23.
//

import UIKit
import PinLayout

class HomeView: View {
    
    let headerView = MainHeaderView()
    let tagsCollectionView = TagsCollectionView()
    let collectionView: UICollectionView = {
        let layout = MosaicLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceVertical = true
        collectionView.register(GridCell.self, forCellWithReuseIdentifier: GridCell.reusableIdentifier)
        return collectionView
    }()
    private let bottomGradintView = BottomGradientView()
    
    override func setupAppearance() {
        backgroundColor = R.color.black()
    }
    
    override func setupViewHierarchy() {
        addSubview(headerView)
        addSubview(tagsCollectionView)
        addSubview(collectionView)
        addSubview(bottomGradintView)
    }
    
    override func setupLayout() {
        headerView.pin.top(pin.safeArea.top).horizontally().height(52)
        tagsCollectionView.pin.top(to: headerView.edge.bottom).horizontally().height(32+8+8)
        collectionView.pin.top(to: tagsCollectionView.edge.bottom).horizontally().bottom()
        bottomGradintView.pin.bottom().horizontally().height(251)
    }
}
