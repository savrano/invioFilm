//
//  SplashScreen.swift
//  InvioFilm
//
//  Created by Yağız Savran on 29.06.2022.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.5
    
    var body: some View {
        if self.isActive {
            MovieSearchScreen()
        } else{
            VStack{
                VStack{
                    Image(K.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.55) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
