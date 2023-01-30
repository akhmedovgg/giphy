//
//  GridCell.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 29/01/23.
//

import UIKit
import Kingfisher

class GridCell: CollectionViewCell<View> {
    
    static let reusableIdentifier = "GridCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func setupAppearance() {
        super.setupAppearance()
        
        backgroundColor = .random()
        layer.cornerRadius = 4
        clipsToBounds = true
    }
    
    override func setupViewHierarchy() {
        super.setupViewHierarchy()
        
        contentView.addSubview(imageView)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        imageView.pin.all()
    }
    
    func setImage(_ data: Data) {
        self.imageView.image = UIImage(data: data)
    }
    
    func setImage(_ url: URL) {
        self.imageView.kf.setImage(with: url)
    }
}
