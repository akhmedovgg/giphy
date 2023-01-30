//
//  RootViewProtocol.swift
//  Giphy
//
//  Created by Sherzod Akhmedov on 28/01/23.
//

import UIKit

protocol RootViewProtocol {
    
    associatedtype RootView
    
    var rootView: RootView { get }
}

extension RootViewProtocol where Self: UIViewController {
    
    var rootView: RootView {
        guard let view = view as? RootView else {
            fatalError(
                """
                Unable to cast '\(String(describing: view))' to the type '\(RootView.self)', \
                check 'loadView()' method implementation.
                """
            )
        }
        return view
    }
}
