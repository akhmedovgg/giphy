//
//  HomeViewProtocols.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 30/01/23.
//

import Foundation

protocol HomeViewToPresenterProtocol: AnyObject {
    func fetchTrendingGifs(pageSize: Int)
    
    func presentImageDetails(_ image: Image)
}

protocol HomePresenterToViewProtocol: AnyObject {
    func displayTrendingGifs(_ imageCollection: ImageCollection)
}
