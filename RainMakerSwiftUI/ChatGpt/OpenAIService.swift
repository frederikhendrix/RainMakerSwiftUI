//
//  OpenAIService.swift
//  RainMakerSwiftUI
//
//  Created by Mark on 14/03/2023.
//

import Foundation
import Alamofire
import Combine
class OpenAIService{
    let baseUrl = "https://api.openai.com/v1/"
    
    func GetText(message: String) -> AnyPublisher<openAICompletionsResponse, Error> {
        let body = openAICompletionsBody(model: "text-davinci-003", prompt: message, temperature: 0.7, max_tokens: 400)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(constants.apiKey)"
        ]
        return Future{ [weak self]
            promise in
            guard let self = self else { return }
            AF.request(self.baseUrl + "completions", method: .post, parameters: body, encoder: .json, headers: headers).responseDecodable(of: openAICompletionsResponse.self){
                response in
                switch  response.result{
                case .success(let result):
                    promise(.success(result))
                case .failure(let error):
                promise(.failure (error))
                }
            }
        }.eraseToAnyPublisher()

    }
}
struct openAICompletionsBody: Encodable {
    let model: String
    let prompt: String
    let temperature: Float?
    let max_tokens: Int
}
struct openAICompletionsResponse: Decodable {
    let id: String
    let choices: [openAICompletionChoices]
}
struct openAICompletionChoices: Decodable{
    let text: String
    
}
