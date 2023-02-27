//
//  CardView.swift
//  RainMakerSwiftUI
//
//  Created by Mark on 27/02/2023.
//

import SwiftUI

struct CardView: View {
    var color: Color
    var TextColor: Color
    var TopText: String
    var BottomText: String
    var Font: Font
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 25, style: .continuous).fill(color)
                .frame(width: 185, height: 175)
            VStack{
                Text(TopText)
                    .font(.largeTitle)
                    .foregroundColor(TextColor)
                Text(BottomText)
                    .foregroundColor(TextColor)
                    .font(Font)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(color: .red,  TextColor: .white, TopText: "2", BottomText: "3", Font: .largeTitle)
    }
}
