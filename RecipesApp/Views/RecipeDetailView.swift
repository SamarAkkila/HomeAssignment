//
//  RecipeDetailView.swift
//  RecipesApp
//
//  Created by Samar Akkıla on 5/29/25.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            ZStack(alignment: .top) {
                GeometryReader { geometry in
                    AsyncImage(url: URL(string: recipe.photoUrlLarge ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: 400)
                            .clipped()
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                }
                .frame(height: 400)

                
                VStack(alignment: .leading, spacing: 10) {

                    Text(recipe.name ?? "")
                        .font(.title2.bold())
                        .padding(.leading, 10)

                    Text("Cuisine: \(recipe.cuisine ?? "")")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.leading, 10)

                    LinkSection(iconName: "ic-recipe",
                                label: "View Full Recipe",
                                urlString: recipe.sourceUrl ?? "",
                                color: .main)

                    LinkSection(iconName: "ic-youtube",
                                label: "Watch on YouTube",
                                urlString: recipe.youtubeUrl ?? "",
                                color: .red)

                }
               
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 20)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(.systemBackground))
                        .padding(.horizontal,20)
                        .shadow(radius: 5)
                )
                .offset(y: 300)
                
            }
        }
       
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(false) 
    }
}

// MARK: - Reusable Link Section

struct LinkSection: View {
    let iconName: String
    let label: String
    let urlString: String
    let color: Color

    var body: some View {
        HStack(alignment: .center) {
            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)

            Button(action: {
                if let url = URL(string: urlString) {
                    UIApplication.shared.open(url)
                }
            }) {
                Text(label)
                    .foregroundColor(color)
                    .font(.headline)
                    .padding(.leading, 8)
            }
        }
        .padding(.vertical,2)
        .padding(.horizontal)
    }
}

// MARK: - Preview

#Preview {
    NavigationView {
        RecipeDetailView(recipe: Recipe(
            id: UUID(),
            cuisine: "Malaysian",
            name: "Apam Balik",
            photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
            photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
            sourceUrl: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
            youtubeUrl: "https://www.youtube.com/watch?v=6R8ffRRJcrg"
        ))
    }
}
