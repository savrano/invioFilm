//
//  Movie.swift
//  InvioFilm
//
//  Created by Yağız Savran on 27.06.2022.
//

import Foundation

struct Movies: Decodable {
    let movies : [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Codable {
    
    let title: String
    let year: String
    let imdbID: String
    let type: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}
