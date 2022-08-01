//
//  SearchResultsView.swift
//  Moviez
//
//  Created by Manuel Martinez on 31/07/22.
//

import SwiftUI

struct SearchResultsView: View {
    
    let result: SearchResults
    
    var body: some View {
        ZStack {
            Color("barColor")
            VStack(){
                AsyncImage(url: URL(string: result.Poster)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    
                    if result.Poster != "N/A"{
                        ProgressView()
                    } else {
                        Image(systemName: "xmark.icloud")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                }
                .frame(minWidth: 100, maxWidth: 200, minHeight: 250, maxHeight: 300)
                .padding(.top)
                
                    Text(result.Title)
                        .font(.system(size: 20, weight: .bold))
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("textColor"))
                    Text(result.Year)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("textColor"))
                        .padding(.bottom)
            }
            .frame(maxHeight: 800)
            .padding(0)
        }
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(result: SearchResults(Title: "Spider-Man: No Way Home", Year: "2022", Poster: "https://m.media-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg", imdbID: "tt0145487"))
    }
}
