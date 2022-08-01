//
//  MovieModel.swift
//  Moviez
//
//  Created by Manuel Martinez on 31/07/22.
//

import Foundation

struct SearchRequest: Codable {
    let Search: [SearchResults]
}

struct SearchResults: Codable, Identifiable {
    var id: String {
        get{
            self.imdbID
        }
    }
    let Title: String
    let Year: String
    let Poster: String
    let imdbID: String
}
