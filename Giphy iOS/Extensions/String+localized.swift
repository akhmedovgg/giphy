//
//  String+localized.swift
//  Giphy iOS
//
//  Created by Sherzod Akhmedov on 30/01/23.
//

import Foundation

extension String {
    func localized(tableName: String = "Localizable", bundle: Bundle = .main, value: String = "", comment: String = "") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: value, comment: comment)
    }
}
