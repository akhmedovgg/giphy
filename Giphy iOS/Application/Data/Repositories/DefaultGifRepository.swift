//
//  DefaultGifRepository.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 29/01/23.
//

import Foundation
import Moya
import Kingfisher

final class DefaultGifRepository: GifRepository {
    
    let moya = MoyaProvider<GiphyService>(callbackQueue: DispatchQueue.global(qos: .background))
    
    func fetchTrendingGifs(limit: Int, completionHandler: @escaping (Result<ImageCollection, Error>) -> Void) -> Cancellable? {
        moya.request(.fetchTrendingGifs(limit: limit)) { result in
            let decoder = JSONDecoder()
            
            switch result {
            case let .success(response):
                guard let giphyResponse = try? decoder.decode(GiphyResponseDTO.self, from: response.data) else {
                    completionHandler(.failure(NetworkError.unknownError))
                    return
                }
                
                let imageCollection = giphyResponse.toDomain()
                DispatchQueue.main.async {
                    completionHandler(.success(imageCollection))
                }
                
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
        
        return nil
    }
}
