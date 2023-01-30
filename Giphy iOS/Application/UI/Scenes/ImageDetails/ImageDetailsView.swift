//
//  ImageDetailsView.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 30/01/23.
//

import UIKit
import PinLayout

class ImageDetailsView: View {
    
    let closeButton: IconButton = {
        let button = IconButton()
        button.imageView.image = R.image.icons.sfSymbols.multiply()
        button.imageView.tintColor = R.color.white()
        return button
    }()
    
    let shareButton: IconButton = {
        let button = IconButton()
        button.imageView.image = R.image.icons.sfSymbols.squareAndArrowUp()
        button.imageView.tintColor = R.color.white()
        return button
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = R.color.eerieBlack()
        return imageView
        
    }()
    
    let copyGifLinkButton: Button = {
        let button = Button()
        button.titleLabel.text = "COPY_GIF_LINK".localized()
        button.titleLabel.textColor = R.color.white()
        button.titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = R.color.interdimensionalBlue()
        button.layer.cornerRadius = 4
        return button
    }()
    
    let copyGifButton: Button = {
        let button = Button()
        button.titleLabel.text = "COPY_GIF".localized()
        button.titleLabel.textColor = R.color.white()
        button.titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = R.color.eerieBlack()
        button.layer.cornerRadius = 4
        return button
    }()
    
    let cancelButton: Button = {
        let button = Button()
        button.titleLabel.text = "CANCEL".localized()
        button.titleLabel.textColor = R.color.white()
        button.titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        button.backgroundColor = R.color.eerieBlack()
        button.layer.cornerRadius = 4
        return button
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.color = R.color.white()
        return view
    }()
    
    override func setupAppearance() {
        backgroundColor = R.color.black()
    }
    
    override func setupViewHierarchy() {
        addSubview(closeButton)
        addSubview(shareButton)
        addSubview(imageView)
        addSubview(copyGifLinkButton)
        addSubview(copyGifButton)
        addSubview(cancelButton)
        imageView.addSubview(activityIndicatorView)
    }
    
    override func setupLayout() {
        imageView.pin.width(bounds.width - 64).height(bounds.width - 64).center().marginBottom(64)
        cancelButton.pin.bottom(pin.safeArea.bottom + 24).height(42).horizontally(24)
        copyGifButton.pin.bottom(to: cancelButton.edge.top).marginBottom(12).left(to: cancelButton.edge.left).right(to: cancelButton.edge.right).height(of: cancelButton)
        copyGifLinkButton.pin.bottom(to: copyGifButton.edge.top).marginBottom(12).left(to: copyGifButton.edge.left).right(to: copyGifButton.edge.right).height(of: copyGifButton)
        closeButton.pin.width(24).height(24).top(12).left(to: imageView.edge.left)
        shareButton.pin.width(24).height(24).top(12).right(to: imageView.edge.right)
        activityIndicatorView.pin.center().width(64).height(64)
    }
}

extension ImageDetailsView {
    func setImage(_ url: URL?) {
        imageView.kf.setImage(with: url)
    }
}
