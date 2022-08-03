//
//  MovieDetailViewModel.swift
//  InvioFilm
//
//  Created by Yağız Savran on 27.06.2022.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    @Published var movieDetail : DetailViewModel?
    
    @Published var pageLoading = false
    
    let apiService = APIService()
    
    func getMovieDetail(imdbID: String) {
        apiService.getMovieDetail(imdbID: imdbID) { result in
            
            switch result {
                
            case .failure(let error):
                print(error)
            case .success(let movieDetail):
                DispatchQueue.main.async {
                    self.movieDetail = DetailViewModel(detail: movieDetail)
                }
            }
        }
    }
}


struct DetailViewModel {
    
    let detail: MovieDetail
    
    var title: String{
        return detail.title
    }
    
    var poster: String{
        return detail.poster
    }
    
    var actors: String{
        return detail.actors
    }
    
    var genre: String{
        return detail.genre
    }
    
    var director: String{
        return detail.director
    }
    
    var runtime: String {
        return detail.runtime
    }
    
    var year: String{
        return detail.year
    }

    var imdbID: String{
        return detail.imdbID
    }
    
    var imdbRating: String{
        return detail.imdbRating
    }
    
    var plot: String{
        return detail.plot
    }   
}
