//
//  SeriesResultsViewModel.swift
//  Moviez
//
//  Created by Manuel Martinez on 31/07/22.
//

import Foundation
import Combine

class SeriesResultsViewModel: ObservableObject {
    
    @Published var searchInput: String = ""
    @Published var resultText: String = ""
    
    var searchCancellable: AnyCancellable? = nil
    
    init() {
        searchCancellable = $searchInput
            .removeDuplicates()
            .debounce(for: 0.6, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                
                if str == "" {
                    
                    self.series.removeAll()
                    self.resultText = ""
                    
                } else {
                    self.series.removeAll()
                    self.searchSeries(name: str)
                }
                
            })
    }
    
    let didChange = PassthroughSubject<SeriesResultsViewModel, Never>()
    
    @Published var series = [SearchResults]() {
        didSet {
            didChange.send(self)
            self.resultText = "Results of: \(self.searchInput)"
        }
    }
    
    func searchSeries(name: String) {
        
        let replaced = name.replacingOccurrences(of: " ", with: "%20")
        
        NetworkManager().getMovies(stringUrl: "https://omdbapi.com/?apikey=9f62c5cd&s=\(replaced)&type=series") {
            self.series = $0.Search
        }
    }
    
}

