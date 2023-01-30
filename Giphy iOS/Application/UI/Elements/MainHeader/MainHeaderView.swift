//
//  MainHeaderView.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 28/01/23.
//

import UIKit

class MainHeaderView: View {
    
    private let logotypeImageView: UIImageView = {
        let view = UIImageView(image: R.image.logotype.full())
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let cameraLabel: UILabel = {
        let view = UILabel()
        view.text = "Camera"
        view.font = .systemFont(ofSize: 16, weight: .semibold)
        view.textColor = R.color.white()
        
        return view
    }()
    
    private let cameraImageView: UIImageView = {
        let view = UIImageView(image: R.image.icons.sfSymbols.camera())
        view.contentMode = .scaleAspectFit
        view.tintColor = R.color.white()
        return view
    }()
    let cameraControl: Control = {
        let view = Control()
        return view
    }()
    
    override func setupAppearance() {
        backgroundColor = R.color.black()
    }
    
    override func setupViewHierarchy() {
        addSubview(logotypeImageView)
        
        addSubview(cameraControl)
        cameraControl.addSubview(cameraLabel)
        cameraControl.addSubview(cameraImageView)
    }
    
    override func setupLayout() {
        logotypeImageView.pin.width(100).sizeToFit(.width).vCenter().left(16)
        
        let cameraLabelSize = cameraLabel.sizeThatFits(bounds.size)
        cameraControl.pin.vertically().width(cameraLabelSize.width + 16 + 20).right(16)
        cameraLabel.pin.sizeToFit().vCenter().left()
        cameraImageView.pin.width(28).vertically().right()
    }
}
