//
//  ImageDetailsViewController.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 30/01/23.
//

import UIKit
import Kingfisher

class ImageDetailsViewController: ViewController<ImageDetailsView> {
    
    var presenter: ImageDetailsViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
}

extension ImageDetailsViewController: ImageDetailsPresenterToView {
    func showActivityIndicator() {
        rootView.activityIndicatorView.startAnimating()
    }
    
    func hideActivityIndicator() {
        rootView.activityIndicatorView.stopAnimating()
    }
    
    func presentImage(_ url: URL?) {
        rootView.setImage(url)
    }
    
    func displayDismissableAlert(title: String?, message: String?) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "CANCEL".localized(), style: .cancel)
        controller.addAction(cancelAction)
        present(controller, animated: true)
    }
}

private extension ImageDetailsViewController {
    
    func setupViews() {
        rootView.closeButton.addTarget(self, action: #selector(didTapClose(_:)), for: .touchUpInside)
        rootView.shareButton.addTarget(self, action: #selector(didTapShare(_:)), for: .touchUpInside)
        rootView.copyGifLinkButton.addTarget(self, action: #selector(didCopyGifLink(_:)), for: .touchUpInside)
        rootView.copyGifButton.addTarget(self, action: #selector(didCopyGif(_:)), for: .touchUpInside)
        rootView.cancelButton.addTarget(self, action: #selector(didTapClose(_:)), for: .touchUpInside)
    }
    
    @objc func didTapClose(_ sender: Button) {
        dismiss(animated: true)
    }

    @objc func didTapShare(_ sender: Button) {
        presenter?.shareImage()
    }
    
    @objc func didCopyGifLink(_ sender: Button) {
        presenter?.copyGifLink()
    }
    
    @objc func didCopyGif(_ sender: Button) {
        presenter?.copyGif()
    }
}
