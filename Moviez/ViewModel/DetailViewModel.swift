//
//  DetailViewModel.swift
//  Moviez
//
//  Created by Manuel Martinez on 01/08/22.
//

import Foundation
import Combine

class DetailsViewModel: ObservableObject {
    init(id: String) {
        self.imdbId = id
        self.itemInfo = DetailResults(Title: "", Year: "", Poster: "", imdbID: "", Rated: "", Released: "", Runtime: "", Genre: "", Director: "", Writer: "", Actors: "", Plot: "", imdbRating: "", imdbVotes: "")
        self.searchMovies()
    }
    
    let imdbId: String
    
    let didChange = PassthroughSubject<DetailsViewModel, Never>()
    
    @Published var itemInfo: DetailResults {
        didSet {
            didChange.send(self)
        }
    }
    
    func searchMovies() {
        
        NetworkManager().getDetails(stringUrl: "https://omdbapi.com/?apikey=9f62c5cd&i=\(imdbId)") {
            self.itemInfo = $0
        }
    }
    
}
