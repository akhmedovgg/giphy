//
//  IconButton.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 30/01/23.
//

import UIKit

class IconButton: Control {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private static let animationDuration: TimeInterval = 0.088
    
    override var isHighlighted: Bool {
        didSet {
            guard isHighlighted != oldValue else { return }
            isHighlighted ? animateIn() : animateOut()
        }
    }
    
    override func setupAppearance() {
        
    }
    
    override func setupViewHierarchy() {
        addSubview(imageView)
    }
    
    override func setupLayout() {
        imageView.pin.all()
    }
    
    
}

private extension IconButton {
    
    func animateIn() {
        UIView.animate(withDuration: Self.animationDuration, delay: 0, options: [.allowUserInteraction, .curveEaseIn]) { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 0.94, y: 0.94)
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: Self.animationDuration, delay: 0, options: [.allowUserInteraction, .curveEaseOut]) { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}
