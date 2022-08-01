//
//  DetailView.swift
//  Moviez
//
//  Created by Manuel Martinez on 01/08/22.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var detailModel: DetailsViewModel = DetailsViewModel(id: "")
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    // Poster Image
                    AsyncImage(url: URL(string: detailModel.itemInfo.Poster)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        if detailModel.itemInfo.Poster != "N/A" {
                            ProgressView()
                        } else {
                            Image(systemName: "xmark.icloud")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                    }
                    .frame(width: 200)
                    
                    // Info
                    Text(detailModel.itemInfo.Title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .padding()
                        .multilineTextAlignment(.center)
                    Text("Rated: \(detailModel.itemInfo.Rated) - Year: \(detailModel.itemInfo.Year)")
                        .font(.footnote)
                        .fontWeight(.medium)
                    Text("Released: \(detailModel.itemInfo.Released)")
                        .font(.footnote)
                        .fontWeight(.medium)
                    
                    // Second Info
                    Divider()
                    VStack(alignment: .leading, spacing: 10){
                        Text("**Genre:** \(detailModel.itemInfo.Genre)")
                            .font(.body)
                            .fontWeight(.medium)
                        Text(detailModel.itemInfo.Plot)
                            .font(.body)
                            .fontWeight(.medium)
                        Text("**Director:** \(detailModel.itemInfo.Director)")
                        Text("**Writer:** \(detailModel.itemInfo.Writer)")
                        Text("**Actors:** \(detailModel.itemInfo.Actors)")
                    }
                    .padding()
                    
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    init(idItem: String) {
        detailModel = DetailsViewModel(id: idItem)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(idItem: "tt0976192")
    }
}
