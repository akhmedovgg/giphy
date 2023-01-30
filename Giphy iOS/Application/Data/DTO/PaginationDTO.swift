//
//  PaginationDTO.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 29/01/23.
//

import Foundation

struct PaginationDTO: Codable {
    let totalCount: Int
    let count: Int
    let offset: Int
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case count = "count"
        case offset = "offset"
    }
}
