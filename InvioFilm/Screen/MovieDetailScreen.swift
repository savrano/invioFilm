//
//  MovieDetailScreen.swift
//  InvioFilm
//
//  Created by Yağız Savran on 27.06.2022.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    @ObservedObject var movieDetailVM : MovieDetailViewModel
    
    init (imdbID:String) {
        self.movieDetailVM = MovieDetailViewModel()
        self.movieDetailVM.getMovieDetail(imdbID: imdbID)
    }
    
    var body: some View {
        if let movieDetail = movieDetailVM.movieDetail {
            ScrollView{
                VStack{
                    VStack{
                        AsyncImageView(posterURL: movieDetail.poster)
                        Text(movieDetail.title)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Divider()
                            .frame(width: UIScreen.main.bounds.width * 0.3, alignment: .center)
                        Text(movieDetail.director)
                            .font(.body)
                            .padding(.top, 1)
                        Text(movieDetail.year)
                            .padding(1)
                    }
                    HStack(alignment: .top){
                        VStack{
                            Text(K.MovieDetail.length)
                                .font(.title3)
                                .foregroundColor(.gray)
                                .padding(.bottom, 1)
                            
                            
                            Text(movieDetail.runtime)
                                .font(.body)
                        }.padding()
                        
                        Divider()
                        
                        VStack{
                            Text(K.MovieDetail.genre)
                                .font(.title3)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 1)
                            
                            
                            Text(movieDetail.genre)
                                .font(.body)
                                .lineLimit(2)
                            
                        }.padding()
                        
                        Divider()
                        
                        VStack{
                            Text(K.MovieDetail.imdb)
                                .font(.title3)
                                .foregroundColor(.gray)
                                .padding(.bottom, 1)
                            
                            
                            Text(movieDetail.imdbRating)
                                .font(.body)
                        }.padding()
                    }
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text(K.MovieDetail.plot)
                                .font(.callout)
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        HStack{
                            Text(movieDetail.plot)
                                .font(.body)
                            Spacer()
                        }
                    }
                    .padding()
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text(K.MovieDetail.actors)
                                .font(.callout)
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        HStack{
                            Text(movieDetail.actors)
                                .font(.body)
                            Spacer()
                        }
                        .padding(.bottom, 20)
                    }
                    .padding()
                }
            }
        } else{
            LottieView(fileName: K.Animation.pageLoading, loopMode: .loop, animationProgress: $movieDetailVM.pageLoading)
                .frame(width: 50, height: 50)
        }
    }
    
    @ViewBuilder
    func AsyncImageView(posterURL: String) -> some View {
        AsyncImage(url: URL(string: posterURL), content: { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 250 )
                .overlay(RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 12))
                .cornerRadius(30)
            
        }) {
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 180, height: 250)
                    .cornerRadius(30)
            }
        }
    }
}


struct MovieDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailScreen(imdbID: "test")
    }
}
