//
//  NeumorphicStyleTextField.swift
//  InvioFilm
//
//  Created by Yağız Savran on 27.06.2022.
//

import SwiftUI

struct NeumorphicStyleTextField: View {
    var textfield: TextField<Text>
    var imageName: String
    @Binding var movieName: String
    
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .foregroundColor(.darkShadow)
            textfield
                .modifier(TextFieldClearButton(text: $movieName))
        }
        .padding()
        .foregroundColor(.neumorphictextColor)
        .background(Color.background)
        .cornerRadius(6)
        .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
        .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)
        
    }
}

