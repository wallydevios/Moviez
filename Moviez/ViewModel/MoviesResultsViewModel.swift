//
//  MoviesResultsViewModel.swift
//  Moviez
//
//  Created by Manuel Martinez on 31/07/22.
//
import Foundation
import Combine

class MoviesResultsViewModel: ObservableObject {
    
    @Published var searchInput: String = ""
    @Published var resultText: String = ""
    
    var searchCancellable: AnyCancellable? = nil
    
    init() {
        searchCancellable = $searchInput
            .removeDuplicates()
            .debounce(for: 0.6, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                
                if str == "" {
                    
                    self.movies.removeAll()
                    self.resultText = ""
                    
                } else {
                    self.movies.removeAll()
                    self.searchMovies(name: str)
                }
                
            })
    }
    
    let didChange = PassthroughSubject<MoviesResultsViewModel, Never>()
    
    @Published var movies = [SearchResults]() {
        didSet {
            didChange.send(self)
            self.resultText = "Results of: \(self.searchInput)"
        }
    }
    
    func searchMovies(name: String) {
        
        let replaced = name.replacingOccurrences(of: " ", with: "%20")
        
        NetworkManager().getMovies(stringUrl: "https://omdbapi.com/?apikey=9f62c5cd&s=\(replaced)&type=movie") {
            self.movies = $0.Search
        }
    }
    
}
