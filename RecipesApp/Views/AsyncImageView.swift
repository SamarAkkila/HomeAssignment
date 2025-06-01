//
//  AsyncImageView.swift
//  RecipesApp
//
//  Created by Samar Akkıla on 5/29/25.
//

import SwiftUI

struct AsyncImageView: View {
    
    @StateObject private var loader: ImageLoader

      init(url: String?) {
          _loader = StateObject(wrappedValue: ImageLoader(urlString: url))
      }

      var body: some View {
          Group {
              if let image = loader.image {
                  Image(uiImage: image)
                      .resizable()
                      .scaledToFill()
              } else {
                  Rectangle()
                      .foregroundColor(.gray.opacity(0.2))
                      .overlay(
                          ProgressView()
                      )
              }
          }
          .onAppear {
              Task {
                  await loader.load()
              }
          }
      }
}

//#Preview {
//    AsyncImageView()
//}
