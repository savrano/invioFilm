//
//  View+Extensions.swift
//  InvioFilm
//
//  Created by Yağız Savran on 30.06.2022.
//

import Foundation
import SwiftUI

extension View {
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
