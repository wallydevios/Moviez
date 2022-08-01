//
//  SerieSearch.swift
//  Moviez
//
//  Created by Manuel Martinez on 31/07/22.
//

import SwiftUI

struct SerieSearchView: View {
    @ObservedObject var searchModel = SeriesResultsViewModel()
    
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
            
            
            if searchModel.series.count == 0 {
                Text("Search a Serie")
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundColor(.yellow)
            } else {
                ScrollView {
                    ForEach(searchModel.series) { result in
                        SearchResultsView(result: result)
                    }
                    .padding()
                }
            }
        }

    }}

struct SerieSearch_Previews: PreviewProvider {
    static var previews: some View {
        SerieSearchView()
    }
}
