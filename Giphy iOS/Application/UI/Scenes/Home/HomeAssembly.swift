//
//  HomeAssembly.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 30/01/23.
//

import Foundation
import Swinject

final class HomeAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(HomeViewPresenter.self) { resolver in
            let fetchTrendingGifsUseCase = resolver.resolve(FetchTrendingGifsUseCase.self)!
            return HomeViewPresenter(fetchTrendingGifsUseCase: fetchTrendingGifsUseCase)
        } .initCompleted { resolver, presenter in
            presenter.view = resolver.resolve(HomeViewController.self)
        }
        
        container.register(HomeViewController.self) { resolver in
            let presenter = resolver.resolve(HomeViewPresenter.self)!
            return HomeViewController(presenter: presenter)
        }
        
        container.register(GifRepository.self) { _ in
            return DefaultGifRepository()
        }
        
        container.register(FetchTrendingGifsUseCase.self) { resolver in
            let gifRepository = resolver.resolve(GifRepository.self)!
            return DefaultFetchTrendingGifsUseCase(gifRepository: gifRepository)
        }
    }
}

extension HomeAssembly {
    static func createContainer() -> Container {
        let container = Container()
        let assembly = HomeAssembly()
        assembly.assemble(container: container)
        return container
    }
}
