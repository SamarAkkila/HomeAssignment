//
//  Constants.swift
//  RecipesApp
//
//  Created by Samar Akkıla on 5/29/25.
//

import Foundation

struct Constants {
    
    struct URLs {
        static let recipes = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        static let MalformedData = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
        static let EmptyData = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    }
    
    struct Messages {
        static let emptyData = "No recipes available."
        static let MalformedData = "Data is malformed. Please try again later."
        static let GenericData = "Failed to load recipes."
        static let invalidURL = "Invalid URL"
       
    }
}
