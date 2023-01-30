//
//  CollectionViewCell.swift
//  Giphy
//
//  Created by Sherzod Akhmedov on 28/01/23.
//

import UIKit
import PinLayout

class CollectionViewCell<RootView: UIView>: UICollectionViewCell {
    
    let rootView = RootView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearance()
        setupViewHierarchy()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    func setupAppearance() {
        
    }
    
    func setupViewHierarchy() {
        contentView.addSubview(rootView)
    }
    
    func setupLayout() {
        rootView.pin.all()
    }
}
