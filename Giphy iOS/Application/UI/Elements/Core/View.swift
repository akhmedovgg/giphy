//
//  View.swift
//  Giphy
//
//  Created by Sherzod Akhmedov on 28/01/23.
//

import UIKit

class View: UIView {
    
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
        
    }
    
    func setupLayout() {
        
    }
}
