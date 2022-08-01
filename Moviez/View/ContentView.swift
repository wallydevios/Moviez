//
//  ContentView.swift
//  Moviez
//
//  Created by Manuel Martinez on 31/07/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            MovieSearchView()
                .tabItem {
                    Image(systemName: "video.fill")
                    Text("Movies")
                }
            SerieSearchView()
                .tabItem {
                    Image(systemName: "display")
                    Text("Characters")
                }
            GamesSearchView()
                .tabItem {
                    Image(systemName: "gamecontroller.fill")
                    Text("Games")
                }
        }
        .accentColor(.yellow)
    }
    
    init() {
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().barTintColor = UIColor(Color("barColor"))
        UITabBar.appearance().backgroundColor = UIColor(Color("barColor"))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
