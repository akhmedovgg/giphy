//
//  ImageDetailsAssembly.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 30/01/23.
//

import Foundation
import Swinject

final class ImageDetailsAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(ImageDetailsPresenter.self) { resolver in
            let urlSession = resolver.resolve(URLSession.self)!
            return ImageDetailsPresenter(session: urlSession)
        } .initCompleted { resolver, presenter in
            presenter.view = resolver.resolve(ImageDetailsViewController.self)
        } .inObjectScope(.container)

        container.register(ImageDetailsViewController.self) { resolver in
            let controller = ImageDetailsViewController()
            controller.presenter = resolver.resolve(ImageDetailsPresenter.self)!
            return controller
        }

        container.register(URLSession.self) { _ in
            return URLSession(configuration: .default)
        }
    }
}

extension ImageDetailsAssembly {
    static func createContainer() -> Container {
        let container = Container()
        let assembly = ImageDetailsAssembly()
        assembly.assemble(container: container)
        return container
    }
}
