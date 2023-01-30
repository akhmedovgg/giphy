//
//  GiphyResponseDTO.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 29/01/23.
//

import Foundation

struct GiphyResponseDTO: Codable {
    let data: [GiphyResponseDTO.Data]
    let pagination: PaginationDTO
}

extension GiphyResponseDTO {
    struct Data: Codable {
        let id: String
        let images: Content
    }
}

extension GiphyResponseDTO.Data {
    struct Content: Codable {
        let original: Image
        let originalStill: Image
        
        enum CodingKeys: String, CodingKey {
            case original = "original"
            case originalStill = "downsized_medium"
        }
    }
}

extension GiphyResponseDTO.Data.Content {
    struct Image: Codable {
        let height: String
        let width: String
        let size: String
        let url: String
        let frames: String?
        let hash: String?
    }
}

extension GiphyResponseDTO {
    func toDomain() -> ImageCollection {
        let downsizedImages = data.map({ Image(height: CGFloat(Float($0.images.originalStill.height) ?? 0),
                                               size: Float($0.images.originalStill.size) ?? 0,
                                               url: URL(string: $0.images.originalStill.url)!,
                                               downloadURL: URL(string: $0.images.original.url)!,
                                               width: CGFloat((Float($0.images.originalStill.width)) ?? 0)) })
        
        let pagination = Pagination(totalCount: self.pagination.totalCount,
                                    count: self.pagination.count,
                                    offset: self.pagination.offset)
        
        return ImageCollection(fixedHeightDownsampled: downsizedImages,
                               pagination: pagination)
    }
}
