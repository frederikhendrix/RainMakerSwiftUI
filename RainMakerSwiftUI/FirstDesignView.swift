//
//  FirstDesignView.swift
//  RainMakerSwiftUI
//
//  Created by Mark on 13/03/2023.
//

import SwiftUI

struct FirstDesignView: View {
    var body: some View {
        VStack{
            HStack{
                CardView(color: Color(red: 255 / 255, green: 44 / 255, blue: 38 / 255), TextColor: .white, TopText: "25°C", BottomText: "20°C", Font: .subheadline)
                CardView(color: .white,TextColor: .black, TopText: "0", BottomText: "MM/H", Font: .largeTitle)
            }
            HStack{
                CardView(color: .yellow, TextColor: .black, TopText: "319", BottomText: "Sun Power", Font: .largeTitle)
                CardView(color: Color(red: 72 / 255, green: 191 / 255, blue: 83 / 255), TextColor: .black, TopText: "2.8", BottomText: "M/S", Font: .largeTitle)
            }
            ScrollView(.vertical){
                Text("If you tend to feel hot during exercise and the weather is 16 degrees Celsius with a slight breeze, you should consider wearing breathable, moisture-wicking clothing that will help keep you cool and dry. Here are some recommendations:")
                Spacer()
                Text("Clothing: Wear lightweight, breathable athletic clothing such as shorts or leggings, a moisture-wicking t-shirt, and a lightweight jacket or long-sleeved shirt if you feel you need extra coverage. Avoid heavy materials that could trap heat and make you feel uncomfortably warm.")
                Text("Footwear: Wear comfortable running shoes with good ventilation to keep your feet cool.")
                Text("Headgear: Wear a lightweight, breathable hat or headband to help wick sweat away from your forehead.")
                Text("Sunglasses: Wear sunglasses to protect your eyes from the sun and reduce glare.")
                Text("Accessories: You may want to consider wearing a lightweight sports watch to track your time and distance, and bring a water bottle to stay hydrated during your run.")
            }
            .frame(height: 400)
            .font(.subheadline)
            Spacer()
        }
    }
}

struct FirstDesignView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDesignView()
    }
}
