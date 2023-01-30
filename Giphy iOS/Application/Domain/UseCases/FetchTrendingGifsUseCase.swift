//
//  FetchTrendingGifsUseCase.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 29/01/23.
//

import Foundation

protocol FetchTrendingGifsUseCase {
    @discardableResult func execute(limit: Int, completionHandler: @escaping (Result<ImageCollection, Error>) -> Void) -> Cancellable?
}

final class DefaultFetchTrendingGifsUseCase: FetchTrendingGifsUseCase {
    
    private let gifRepository: GifRepository
    
    init(gifRepository: GifRepository) {
        self.gifRepository = gifRepository
    }
    
    func execute(limit: Int, completionHandler: @escaping (Result<ImageCollection, Error>) -> Void) -> Cancellable? {
        return gifRepository.fetchTrendingGifs(limit: limit, completionHandler: completionHandler)
    }
}
