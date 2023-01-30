//
//  TextField.swift
//  Giphy
//
//  Created by Sherzod Akhmedov on 28/01/23.
//

import UIKit

class TextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayout()
    }
    
    func commonInit() {
        setupAppearance()
        setupViewHierarchy()
    }
    
    func setupAppearance() {
        
    }
    
    func setupViewHierarchy() {
        
    }
    
    func setupLayout() {
        
    }
}
