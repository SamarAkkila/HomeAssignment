//
//  ImageCacheManager.swift
//  RecipesApp
//
//  Created by Samar Akkıla on 5/29/25.
//

import UIKit

class ImageCacheManager {
    static let shared = ImageCacheManager()

    private init() {}

    private var cacheDirectory: URL {
        FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    }

    private func filePath(for url: URL) -> URL {
        let fileName = url.lastPathComponent
        return cacheDirectory.appendingPathComponent(fileName)
    }

    func getCachedImage(for url: URL) -> UIImage? {
        let fileURL = filePath(for: url)
        guard FileManager.default.fileExists(atPath: fileURL.path),
              let data = try? Data(contentsOf: fileURL),
              let image = UIImage(data: data) else {
            return nil
        }
        return image
    }

    func saveImageToCache(_ image: UIImage, for url: URL) {
        let fileURL = filePath(for: url)
        guard let data = image.jpegData(compressionQuality: 1.0) else { return }
        try? data.write(to: fileURL)
    }
}
