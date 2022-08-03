//
//  MovieSearchScreen.swift
//  InvioFilm
//
//  Created by Yağız Savran on 27.06.2022.
//

import SwiftUI

struct MovieSearchScreen: View {
    
    @StateObject private var movieSearchVM = MovieSearchViewModel()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .center){
                ScrollView{
                    VStack{
                        HStack{
                            NeumorphicStyleTextField(textfield: TextField.init(K.textfieldPlaceholder, text: $movieSearchVM.movieName, onCommit: {
                                self.hideKeyboard()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    self.movieSearchVM.searchMovie(movieName: movieSearchVM.movieName.replacingCharacterForURL())
                                }
                                
                            }), imageName: K.textfieldIconName, movieName: $movieSearchVM.movieName)
                            .alert(isPresented: $movieSearchVM.showAlert) {
                                Alert(title: Text(K.Alert.emptyTitle), message: Text(K.Alert.emptyMessage), dismissButton: .default(Text(K.Alert.buttonText)))
                            }
                        }
                        
                        Button {
                            self.hideKeyboard()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                self.movieSearchVM.searchMovie(movieName: movieSearchVM.movieName.replacingCharacterForURL())
                            }
                            
                        } label: {
                            Text(K.buttonText)
                        }
                        .tint(Color(K.invioGreenColor))
                        .controlSize(.large)
                        .buttonStyle(.borderedProminent)
                        .alert(isPresented: $movieSearchVM.showAlert2) {
                            Alert(title: Text(K.Alert.wrongMovieTitle), message: Text(K.Alert.wrongMovieMessage), dismissButton: .default(Text(K.Alert.buttonText)))
                        }
                        .padding()
                        
                        if !movieSearchVM.pageLoading{
                            
                            ForEach(movieSearchVM.movies, id: \.imdbID) { movie in
                                NavigationLink {
                                    MovieDetailScreen(imdbID: movie.imdbID)
                                    
                                } label: {
                                    HStack{
                                        AsyncImageView(posterURL: movie.poster)
                                        VStack{
                                            Text(movie.title)
                                                .font(.title3)
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.leading)
                                        }
                                        Spacer()
                                    }
                                    .padding()
                                }
                            }
                            .listStyle(.inset)
                        } else{
                            Spacer()
                        }
                    }
                }
                if movieSearchVM.pageLoading{
                    LottieView(fileName: K.Animation.pageLoading, loopMode: .loop, animationProgress: $movieSearchVM.pageLoading)
                        .frame(width: 50, height: 50, alignment: .center)
                        .onReceive(timer) { _ in
                            movieSearchVM.startTimer()
                        }
                }
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image(K.icon)
                }
            }
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
    
    @ViewBuilder
    func AsyncImageView(posterURL: String) -> some View {
        AsyncImage(url: URL(string: posterURL), content: { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 150)
            
        }) {
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 100, height: 150)
                LottieView(fileName: K.Animation.posterLoading, loopMode: .loop, animationProgress: $movieSearchVM.posterLoading)
                    .frame(width: 50, height: 50)
            }
        }
    }
}

struct MovieSearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchScreen()
    }
}


