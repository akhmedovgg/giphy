//
//  GifRepository.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 29/01/23.
//

import Foundation

protocol GifRepository {
    @discardableResult func fetchTrendingGifs(limit: Int, completionHandler: @escaping (Result<ImageCollection, Error>) -> Void) -> Cancellable?
}
