//
//  LottieView.swift
//  InvioFilm
//
//  Created by Yağız Savran on 29.06.2022.
//

import Foundation
import SwiftUI
import Lottie


struct LottieView: UIViewRepresentable {
    
    var fileName : String
    var loopMode: LottieLoopMode
    @Binding var animationProgress: Bool
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        
        let view = UIView(frame: .zero)

        let animationView = AnimationView()
        let animation = Animation.named(fileName)
        
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        
        animationView.play { complete in
            if complete {
                animationProgress = false
            }
        }

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}
