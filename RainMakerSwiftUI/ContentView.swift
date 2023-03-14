//
//  ContentView.swift
//  RainMakerSwiftUI
//
//  Created by Rik Hendrix on 15/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
           HomePage()
                .tabItem {
                Image(systemName: "house.fill")
                Text("Homepage")
           }
            WardrobeView()
                 .tabItem {
                 Image(systemName: "cabinet.fill")
                 Text("Wardrobe")
            }
        }

 

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
