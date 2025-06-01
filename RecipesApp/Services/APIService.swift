//
//  APIService.swift
//  RecipesApp
//
//  Created by Samar Akkıla on 5/29/25.
//
import Foundation

class APIService {
    
    static let shared = APIService()
    private let recipesURL = URL(string: Constants.URLs.recipes)!
    private let overrideURL: URL?
    
    init(testURL: URL? = nil) {
        self.overrideURL = testURL
    }
    
    func fetchData() async throws -> [Recipe]{
         
        let url = overrideURL ?? recipesURL
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoded = try JSONDecoder().decode([String: [Recipe]].self, from: data)
            
            guard let recipes = decoded["recipes"] else {
                throw ServiceError.malformedData
            }
            
            print("Decoded recipe count: \(recipes.count)")
            if recipes.isEmpty {
                throw ServiceError.emptyData
            }
            
            return recipes
        } catch is DecodingError {
            throw ServiceError.malformedData
        }
         
    }
     
}
