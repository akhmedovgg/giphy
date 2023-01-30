//
//  BottomGradientView.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 28/01/23.
//

import UIKit

class BottomGradientView: Control {
    
    private let bottomView = UIView()
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    override func setupAppearance() {
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor.clear.cgColor, R.color.black()!.cgColor]
        isUserInteractionEnabled = false
    }
    
    override func setupViewHierarchy() {
        
    }
    
    override func setupLayout() {
        
    }
}
