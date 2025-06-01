//
//  ImageCacheManagerTests.swift
//  RecipesApp
//
//  Created by Samar Akkıla on 5/30/25.
//

import XCTest
@testable import RecipesApp

final class ImageCacheManagerTests: XCTestCase{
    
    func testSaveAndLoadImage() {
          guard let image = UIImage(systemName: "heart.fill"),
                let imageData = image.pngData() else {
              XCTFail("Could not create image")
              return
          }

          let testURL = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg")!
          let manager = ImageCacheManager.shared

          manager.saveImageToCache(image, for: testURL)
          let cachedImage = manager.getCachedImage(for: testURL)

          XCTAssertNotNil(cachedImage, "Expected image to be cached")
      }
}
