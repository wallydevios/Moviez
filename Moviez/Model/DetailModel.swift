//
//  DetailModel.swift
//  Moviez
//
//  Created by Manuel Martinez on 01/08/22.
//

import Foundation

struct DetailResults: Codable, Identifiable {
    var id: String {
        get{
            self.imdbID
        }
    }
    let Title: String
    let Year: String
    let Poster: String
    let imdbID: String
    let Rated: String
    let Released: String
    let Runtime: String
    let Genre: String
    let Director: String
    let Writer: String
    let Actors: String
    let Plot: String
    let imdbRating: String
    let imdbVotes: String
}
