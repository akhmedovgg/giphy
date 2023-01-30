//
//  ImageDetailsPresenter.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 30/01/23.
//

import UIKit
import Kingfisher

class ImageDetailsPresenter {
    
    weak var view: ImageDetailsPresenterToView?
    
    private var image: Image?
    private var gifData: Data?
    private let session: URLSession
    
    required init(session: URLSession) {
        self.session = session
    }
    
    func setImage(_ image: Image) {
        view?.showActivityIndicator()
        
        self.image = image
        
        guard let request = try? URLRequest(url: image.downloadURL, method: .get) else {
            return
        }
        
        session.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                guard let data = data else { return }
                self?.gifData = data
                self?.view?.presentImage(image.downloadURL)
                self?.view?.hideActivityIndicator()
            }
        }
        .resume()
    }
}

extension ImageDetailsPresenter: ImageDetailsViewToPresenter {
    
    func copyGifLink() {
        UIPasteboard.general.url = image?.downloadURL
        view?.displayDismissableAlert(title: nil, message: "COPIED".localized())
    }
    
    func copyGif() {
        guard let gifData = gifData else { return }
        UIPasteboard.general.setData(gifData, forPasteboardType: "com.compuserve.gif")
        view?.displayDismissableAlert(title: nil, message: "COPIED".localized())
    }
    
    func shareImage() {
        guard let gifData = gifData else { return }
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: [gifData], applicationActivities: nil)
        self.view?.present(activityViewController, animated: true, completion: nil)
    }
}

