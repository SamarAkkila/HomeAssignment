//
//  ImageLoader.swift
//  RecipesApp
//
//  Created by Samar Akkıla on 5/29/25.
//
import UIKit

@MainActor
class ImageLoader: ObservableObject {
    @Published var image:UIImage?
    
    private let urlString: String?
    
    init(image: UIImage? = nil, urlString: String?) {
        self.image = image
        self.urlString = urlString
    }
    
    func load() async {
        guard let urlString = urlString, let url = URL(string: urlString) else {return}
        
        if let cached = ImageCacheManager.shared.getCachedImage(for: url){
            self.image = cached
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let downloadedImage = UIImage(data: data) else {return}
            
            ImageCacheManager.shared.saveImageToCache(downloadedImage, for: url)
            self.image = downloadedImage
        }catch{
            print("Image downloaf faild: \((error))")
        }
    }
}

