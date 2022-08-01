//
//  GamesResultsViewModel.swift
//  Moviez
//
//  Created by Manuel Martinez on 31/07/22.
//

import Foundation
import Combine

class GamesResultsViewModel: ObservableObject {
    
    @Published var searchInput: String = ""
    @Published var resultText: String = ""
    
    var searchCancellable: AnyCancellable? = nil
    
    init() {
        searchCancellable = $searchInput
            .removeDuplicates()
            .debounce(for: 0.6, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                
                if str == "" {
                    
                    self.games.removeAll()
                    self.resultText = ""
                    
                } else {
                    self.games.removeAll()
                    self.searchGames(name: str)
                }
                
            })
    }
    
    let didChange = PassthroughSubject<GamesResultsViewModel, Never>()
    
    @Published var games = [SearchResults]() {
        didSet {
            didChange.send(self)
            self.resultText = "Results of: \(self.searchInput)"
        }
    }
    
    func searchGames(name: String) {
        
        let replaced = name.replacingOccurrences(of: " ", with: "%20")
        
        NetworkManager().getMovies(stringUrl: "https://omdbapi.com/?apikey=9f62c5cd&s=\(replaced)&type=game") {
            self.games = $0.Search
        }
    }
    
}

