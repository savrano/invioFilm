//
//  APIService.swift
//  InvioFilm
//
//  Created by Yağız Savran on 27.06.2022.
//

import Foundation
import SwiftUI

class APIService {
        
    let baseURL = "https://www.omdbapi.com/?"
    let apiKey = "ac8cbc1d"
    
    func getMovies(search: String, completion: @escaping (Result<[Movie]?, APIServiceError>) -> Void) {

        guard let url = URL(string:"\(baseURL)apikey=\(apiKey)&s=\(search)") else{
            return completion(.failure(.wrongURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(.dataCouldntFetch))
            }
            
            guard let decodedMovie = try? JSONDecoder().decode(Movies.self, from: data) else {
                return completion(.failure(.dataCouldntDecode))
            }
            
            completion(.success(decodedMovie.movies))
        }
        .resume()
    }
    
    func getMovieDetail(imdbID: String, completion: @escaping (Result<MovieDetail, APIServiceError>) -> Void) {
        
        guard let url = URL(string: "\(baseURL)apikey=\(apiKey)&i=\(imdbID)") else{
            return completion(.failure(.wrongURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else{
                return completion(.failure(.dataCouldntFetch))
            }
            
            guard let decodedMovieDetail = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.dataCouldntDecode))
            }
            
            completion(.success(decodedMovieDetail))
        }
        .resume()
    }
}

enum APIServiceError: Error {
    case wrongURL
    case dataCouldntFetch
    case dataCouldntDecode
}
