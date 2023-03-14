//
//  HomePage.swift
//  RainMakerSwiftUI
//
//  Created by Mark on 13/03/2023.
//

import SwiftUI
import Combine
struct HomePage: View {
    let openAIService: OpenAIService
    @State var messages: [GptMessage] = [GptMessage]()
    @State var cancellables = Set<AnyCancellable>()
    @AppStorage("selection") var pickSelection: String?
    init() {
        self.openAIService = OpenAIService()
    }
    var body: some View {
        VStack{
           Image("Logo")
            
            ForEach(messages, id: \.id) { message in
                Text("\(message.text)")
                    .frame(width: 300)
            }
            Spacer()
        }
        .onAppear{
            print(pickSelection ?? "")
        }
    }
    func getMessage() {
        if messages.count != 0 {
            messages.removeAll()
        }
        openAIService.GetText(message: "I want to go for a run. I am usually \(pickSelection ?? "Cold") . it is 16 degrees outside there is no wind and it is not raining. what should i wear? please answer in 50 words").sink { completion in
            // Handle error
            
        } receiveValue: { response in
            guard let textResponse = response.choices.first?.text else { return }
            messages.append(GptMessage(id: response.id, text: textResponse))
        }.store(in: &cancellables)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
