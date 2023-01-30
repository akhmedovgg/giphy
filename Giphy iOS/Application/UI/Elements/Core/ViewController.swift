//
//  ViewController.swift
//  Giphy
//
//  Created by Sherzod Akhmedov on 28/01/23.
//

import UIKit

class ViewController<RootView: UIView>: UIViewController, RootViewProtocol {
    
    override func loadView() {
        view = RootView(frame: UIScreen.main.bounds)
    }
}
