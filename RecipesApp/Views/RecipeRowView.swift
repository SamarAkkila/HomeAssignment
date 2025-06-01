//
//  RecipeRowView.swift
//  RecipesApp
//
//  Created by Samar Akkıla on 5/29/25.
//

import SwiftUI

struct RecipeRowView: View {
    
    let recipe:Recipe
    var body: some View {
        ZStack(alignment: .bottomLeading){
            AsyncImageView(url: recipe.photoUrlSmall)
                .frame(height: 180)
                .clipped()
                .cornerRadius(12)
                .shadow(radius: 3)
                
            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3)]), startPoint: .bottom, endPoint: .center)
                .cornerRadius(12)
            VStack(alignment: .leading , spacing: 4){
                Text(recipe.cuisine)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(recipe.name)
                    .font(.subheadline)
                    .foregroundColor(.white)
                
            }.padding()
                
                
        }
      }
}

 
