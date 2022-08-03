//
//  Constants.swift
//  InvioFilm
//
//  Created by Yağız Savran on 29.06.2022.
//

import Foundation

struct K {

    static let textfieldIconName = "magnifyingglass"
    static let textfieldPlaceholder = "Search Movie"
    static let icon = "invioFilmLogo"
    static let invioGreenColor = "invioGreenColor"
    static let buttonText = "Search"
    static let keyboardDoneText = "Done"
    
    struct Animation {
        static let pageLoading = "movie-loading"
        static let posterLoading = "green-loading"
    }
    struct Alert {
        static let emptyTitle = "Error"
        static let emptyMessage = "Please Enter a Movie Name!"
        static let wrongMovieTitle = "This Movie Was Not Found."
        static let wrongMovieMessage = "Please search for a different movie."        
        static let buttonText = "OK"
    }
    
    struct MovieDetail {
        static let genre = "Genre"
        static let actors = "Actors"
        static let length = "Length"
        static let imdb = "Imdb"
        static let plot = "Plot"
    }
}
