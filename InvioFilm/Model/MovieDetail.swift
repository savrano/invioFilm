//
//  MovieDetail.swift
//  InvioFilm
//
//  Created by Yağız Savran on 27.06.2022.
//

import Foundation


struct MovieDetail: Decodable {
    
    let title: String
    let year: String
    let genre: String
    let director: String
    let actors: String
    let runtime: String
    let plot: String
    let poster: String
    let imdbRating: String
    let imdbID: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case director = "Director"
        case runtime = "Runtime"
        case actors = "Actors"
        case plot = "Plot"
        case poster = "Poster"
        case imdbRating
        case imdbID
    }
}
