//
//  MovieSearchViewModel.swift
//  InvioFilm
//
//  Created by Yağız Savran on 27.06.2022.
//

import Foundation
import SwiftUI

class MovieSearchViewModel: ObservableObject {
    
    var apiService = APIService()
    
    @Published var movies = [MovieViewModel]()
    @Published var movieName: String = ""
    @Published var showAlert = false  // If textfield is empty
    @Published var showAlert2 = false // If movie was not found
    @Published var pageLoading = false
    @Published var posterLoading = false
    
    @Published var timeRemaining = Int.random(in: 6...8)  // if the searched movie is not found for more than 6 - 8 seconds.
    
    func searchMovie(movieName: String) {
        if movieName != ""{
            self.pageLoading = true
            
            apiService.getMovies(search: movieName) { result in
                
                switch result {
                    
                case .failure(let error):
                    print(error)
                    if error == .dataCouldntDecode {
                        DispatchQueue.main.async {
                            self.showAlert2 = true
                            self.pageLoading = false
                            self.movies = []
                            self.movieName = ""
                        }
                    }
                case .success(let movieArray):
                    if let movieArray = movieArray {
                        DispatchQueue.main.async {
                            self.movies = movieArray.map(MovieViewModel.init)
                            self.pageLoading = false
                        }
                    }
                }
            }
        } else{
            showAlert = true
            print(showAlert)
        }
    }
    
    func startTimer() {
        
        if self.timeRemaining > 0 {
            self.timeRemaining -= 1
        } else{
            self.showAlert2 = true
            self.pageLoading = false
            self.movieName = ""
            self.movies = []
        }
    }
}

struct MovieViewModel {
    
    let movie: Movie
    
    var title: String {
        return movie.title
    }
    
    var poster: String {
        return movie.poster
    }
    
    var year: String {
        return movie.year
    }
    
    var imdbID: String {
        return movie.imdbID
    }
}
