//
//  RecipeListViewModel.swift
//  RecipesApp
//
//  Created by Samar Akkıla on 5/29/25.
//

import Foundation
@MainActor

class RecipeListViewModel:ObservableObject{
    
    @Published var Recipes: [Recipe] = []
    @Published var errMessage:String?
    @Published var isLoading:Bool = false
  
    func loadRecipes() async {
        isLoading = true
        errMessage = nil
        
        do{
            let recipes = try await APIService.shared.fetchData()
            self.Recipes = recipes
        }catch let error as ServiceError{
            errMessage = error.errorDescription
        } catch {
            errMessage = Constants.Messages.GenericData
        }
        isLoading = false
    }
}
