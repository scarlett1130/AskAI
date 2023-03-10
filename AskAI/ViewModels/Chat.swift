//
//  Chat.swift
//  OpenAIProject
//
//  Created by christian on 1/26/23.
//

import UIKit
import SwiftUI

class Chat: Identifiable, Codable, ObservableObject {
    var id: UUID
    var request: String
    var response: String
    var date: Date
    var engine: Engine
    var generatedImage: Data?
    @Published var isFavorite: Bool
    
    enum CodingKeys: CodingKey {
        case id, request, response, date, engine, generatedImage, isFavorite
    }
    
    init(id: UUID = UUID(), request: String, response: String, date: Date = .now, engine: Engine, generatedImage: Data? = nil, isFavorite: Bool = false) {
        self.id = id
        self.request = request
        self.response = response
        self.date = date
        self.engine = engine
        self.generatedImage = generatedImage
        self.isFavorite = isFavorite
        print("Chat init called")

    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.request = try container.decode(String.self, forKey: .request)
        self.response = try container.decode(String.self, forKey: .response)
        self.date = try container.decode(Date.self, forKey: .date)
        self.engine = try container.decode(Engine.self, forKey: .engine)
        self.generatedImage =  try container.decode(Data?.self, forKey: .generatedImage)
        self.isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
        print("Required init called")
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(request, forKey: .request)
        try container.encode(response, forKey: .response)
        try container.encode(date, forKey: .date)
        try container.encode(engine, forKey: .engine)
        try container.encode(generatedImage, forKey: .generatedImage)
        try container.encode(isFavorite, forKey: .isFavorite)
        print("Chat encoded_")
    }
    
    static let chatGPTExample = Chat(request: "This is a really interesting chat request example", response: "This response example is, inconceivably so, even more interesting than the request.", engine: .davinci, isFavorite: true)
    static let dallEExample = Chat(request: "twitter bird example", response: "", engine: .DALLE, generatedImage: UIImage(named: "twitter")!.pngData())
}
