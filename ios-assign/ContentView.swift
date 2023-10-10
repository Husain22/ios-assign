//
//  ContentView.swift
//  ios-assign
//
//  Created by Husain Alkuwaiti on 06/10/2023.
//


import SwiftUI

let categories = ["rock", "pop", "hip-hop"]

var songs: [Song] = [
        Song(name: "hello", category: "pop"),
        Song(name: "Hey Jude", category: "rock"),
        Song(name: "Bad Guy", category: "pop"),
        Song(name: "Lose Yourself", category: "hip-hop"),
        Song(name: "Bohemian Rhapsody", category: "rock"),
        Song(name: "Shape of You", category: "pop"),
        Song(name: "Uptown Funk", category: "pop"),
        Song(name: "Hotline Bling", category: "hip-hop"),
        Song(name: "Sweet Child o' Mine", category: "rock"),
        Song(name: "Old Town Road", category: "hip-hop"),
        Song(name: "Billie Jean", category: "pop"),
        Song(name: "Smells Like Teen Spirit", category: "rock"),
        Song(name: "All Star", category: "rock"),
        Song(name: "Party in the USA", category: "pop"),
        Song(name: "Empire State of Mind", category: "hip-hop"),
        Song(name: "Stairway to Heaven", category: "rock"),
        Song(name: "Hotel California", category: "rock"),
        Song(name: "Back in Black", category: "rock"),
        Song(name: "Sweet Home Alabama", category: "rock"),
        Song(name: "Imagine", category: "rock"),
        Song(name: "Thunderstruck", category: "rock"),
        Song(name: "Smells Like Teen Spirit", category: "rock"),
        Song(name: "Highway to Hell", category: "rock"),
        Song(name: "We Will Rock You", category: "rock"),
        Song(name: "Don't Stop Believin'", category: "rock")
    ]

struct ContentView: View {
    
    @State private var selectedCategory: String = "rock"
    @State private var searchQuery = ""

    // Filtered songs based on search query and selected category
        var filteredSongs: [Song] {
            let filteredBySearch = songs.filter { song in
                searchQuery.isEmpty || song.name.localizedCaseInsensitiveContains(searchQuery)
            }
            return filteredBySearch.filter { $0.category == selectedCategory }
        }
    
    var body: some View {
            ScrollView {
                VStack {
                    
                    TabView(selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { category in
                            //3
                            Image(category)
                                .resizable()
                                .scaledToFill()
                                .tag(category)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 300)
                    .padding(20)
                    
                    TextField("Search", text: $searchQuery)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    ForEach(filteredSongs, id: \.self) { song in
                        HStack {
                            Image("Cover")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(25)
                            
                            Text(song.name)
                                .padding()
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                } //end vstack
            } // scroll view
    } // end body
}// end content

#Preview {
    ContentView()
}
