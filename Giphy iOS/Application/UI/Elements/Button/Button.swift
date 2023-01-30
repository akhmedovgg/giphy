//
//  Button.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 30/01/23.
//

import UIKit

class Button: Control {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private static let animationDuration: TimeInterval = 0.088
    
    override var isHighlighted: Bool {
        didSet {
            guard isHighlighted != oldValue else { return }
            isHighlighted ? animateIn() : animateOut()
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return titleLabel.sizeThatFits(size)
    }
    
    override func setupAppearance() {
        
    }
    
    override func setupViewHierarchy() {
        addSubview(titleLabel)
    }
    
    override func setupLayout() {
        titleLabel.pin.all()
    }
    
    
}

private extension Button {
    
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
