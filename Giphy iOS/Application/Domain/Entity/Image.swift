//
//  Image.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 29/01/23.
//

import Foundation

struct Image {
    let height: CGFloat
    let size: Float
    let url: URL
    let downloadURL: URL
    let width: CGFloat
    
    init(height: CGFloat, size: Float, url: URL, downloadURL: URL, width: CGFloat) {
        self.height = height
        self.size = size
        self.url = url
        self.downloadURL = downloadURL
        self.width = width
    }
}
