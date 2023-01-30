//
//  GiphyService.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 29/01/23.
//

import Foundation
import Moya

enum GiphyService {
    case fetchTrendingGifs(limit: Int)
}

extension GiphyService: TargetType {
    var baseURL: URL {
        URL(string: "https://api.giphy.com/v1")!
    }
    
    var path: String {
        switch self {
        case .fetchTrendingGifs: return "/gifs/trending"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var task: Task {
        switch self {
        case .fetchTrendingGifs(let limit):
            return .requestParameters(parameters: [
                "api_key": "qdCEnfGcS0H6vtknRLiMXUkXEmGprZZA",
                "limit": limit,
                "rating": "g",
            ], encoding: URLEncoding.queryString)
        }
    }
}
