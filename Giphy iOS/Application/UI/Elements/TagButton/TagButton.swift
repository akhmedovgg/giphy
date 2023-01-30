//
//  TagButton.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 29/01/23.
//

import UIKit

class TagButton: Control {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Trending"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = R.color.white()
        return label
    }()
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let labelSize = titleLabel.sizeThatFits(size)
        return CGSize(width: labelSize.width + 32, height: size.height)
    }
    
    override func setupAppearance() {
        let layer = layer as! CAGradientLayer
        layer.colors = [R.color.interdimensionalBlue()!.cgColor, R.color.metallicViolet()!.cgColor]
    }
    
    override func setupViewHierarchy() {
        addSubview(titleLabel)
    }
    
    override func setupLayout() {
        titleLabel.pin.sizeToFit().center()
        
        layer.cornerRadius = bounds.height / 2
    }
}
