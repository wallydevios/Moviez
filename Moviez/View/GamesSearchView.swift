//
//  GamesSearchView.swift
//  Moviez
//
//  Created by Manuel Martinez on 31/07/22.
//

import SwiftUI

struct GamesSearchView: View {
    
    @ObservedObject var searchModel = GamesResultsViewModel()
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color("textColor"))
                    .font(.system(size: 22, weight: .semibold))
                    .padding(.horizontal, 5)
                TextField("", text: $searchModel.searchInput)
                    .placeholder(when: searchModel.searchInput.isEmpty, placeholder: {
                        Text("Type title")
                            .foregroundColor(Color("textColor"))
                            .fontWeight(.bold)
                    })
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color("textColor"))
                    .disableAutocorrection(true)
            }
            .padding(10)
            .background(Color("barColor"))
            .cornerRadius(50)
            .padding(.horizontal)
            
            
            if searchModel.games.count == 0 {
                Text("Search a Game")
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(.yellow)
            } else {
                
                Text(searchModel.resultText)
                    .foregroundColor(Color("textColor"))
                    .font(.system(size: 22, weight: .bold))
                    .padding(.horizontal, 15)
                
                ScrollView {
                    ForEach(searchModel.games) { result in
                        SearchResultsView(result: result)
                    }
                    .padding()
                }
            }
        }

    }
}

struct GamesSearchView_Previews: PreviewProvider {
    static var previews: some View {
        GamesSearchView()
    }
}
