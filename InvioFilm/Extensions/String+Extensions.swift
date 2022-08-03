//
//  String+Extensions.swift
//  InvioFilm
//
//  Created by Yağız Savran on 1.07.2022.
//

import Foundation

extension String {
    
    func replacingCharacterForURL() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
