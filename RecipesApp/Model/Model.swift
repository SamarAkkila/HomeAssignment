//
//  Model.swift
//  RecipesApp
//
//  Created by Samar Akkıla on 5/29/25.
//
import Foundation
struct Recipe: Codable, Identifiable {
    
    var id:UUID
    var cuisine:String
    var name:String
    var photoUrlLarge:String?
    var photoUrlSmall:String?
    var sourceUrl:String?
    var youtubeUrl:String?
    
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case cuisine
        case name
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
    }
}


enum ServiceError: Error {
    case invalidURL
    case DecodingError(Error)
    case emptyData
    case malformedData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return Constants.Messages.invalidURL
        case .DecodingError(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        case .emptyData:
            return Constants.Messages.emptyData
        case .malformedData:
            return Constants.Messages.MalformedData
        }
    }
}
