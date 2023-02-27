//
//  ContentView.swift
//  RainMakerSwiftUI
//
//  Created by Rik Hendrix on 15/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack{
                CardView(color: .red, TextColor: .white, TopText: "25°C", BottomText: "20°C", Font: .subheadline)
                CardView(color: .white,TextColor: .black, TopText: "0", BottomText: "MM/H", Font: .largeTitle)
            }
            HStack{
                CardView(color: .yellow, TextColor: .black, TopText: "319", BottomText: "Sun Power", Font: .largeTitle)
                CardView(color: .green, TextColor: .black, TopText: "2.8", BottomText: "M/S", Font: .largeTitle)
            }
            Spacer()
        }

 

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
