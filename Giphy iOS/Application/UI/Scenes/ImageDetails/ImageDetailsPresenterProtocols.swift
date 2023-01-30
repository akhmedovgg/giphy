//
//  ImageDetailsView.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 30/01/23.
//

import UIKit
import PinLayout

protocol ImageDetailsViewToPresenter: AnyObject {
    func shareImage()
    func copyGifLink()
    func copyGif()
}

protocol ImageDetailsPresenterToView: UIViewController {
    func showActivityIndicator()
    func hideActivityIndicator()
    func presentImage(_ url: URL?)
    func displayDismissableAlert(title: String?, message: String?)
}
