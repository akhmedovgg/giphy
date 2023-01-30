//
//  HomeViewPresenter.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 30/01/23.
//

import UIKit

final class HomeViewPresenter: HomeViewToPresenterProtocol {
    
    weak var view: HomePresenterToViewProtocol?
    
    private let fetchTrendingGifsUseCase: FetchTrendingGifsUseCase
    
    init(fetchTrendingGifsUseCase: FetchTrendingGifsUseCase) {
        self.fetchTrendingGifsUseCase = fetchTrendingGifsUseCase
    }
    
    func fetchTrendingGifs(pageSize: Int) {
        fetchTrendingGifsUseCase.execute(limit: pageSize) { [weak self] result in
            switch result {
            case let .success(imageCollection):
                self?.view?.displayTrendingGifs(imageCollection)
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func presentImageDetails(_ image: Image) {
        let assembly = ImageDetailsAssembly.createContainer()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let rootViewController = appDelegate.window?.rootViewController,
              let destinationViewController = assembly.resolve(ImageDetailsViewController.self),
              let presenter = assembly.resolve(ImageDetailsPresenter.self) else {
            return
        }
        
        presenter.setImage(image)        
        rootViewController.present(destinationViewController, animated: true)
    }
}
