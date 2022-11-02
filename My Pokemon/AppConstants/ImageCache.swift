//
//  ImageCache.swift
//  My Pokemon
//
//  Created by Keketso Ramosedi on 2022/10/30.
//  Copyright © 2022 TallStack Game Studios. All rights reserved.
//

import UIKit
final class ImageCache {
        
    private static let cache = NSCache<NSString, UIImage>()
    
    private static var responses = [URL: [(UIImage?) -> ()]]()
        
    static func getImage(with url: URL, onComplete: @escaping (UIImage?) -> ()) {
        if let image = cache.object(forKey: url.absoluteString as NSString) {
            onComplete(image)
        } else {
            load(with: url, onComplete: onComplete)
        }
    }
    
    private static func load(with url: URL, onComplete: @escaping (UIImage?) -> ()) {
        let task = URLSession.shared.dataTask(with: url) {data, response, error in

            if responses[url] != nil {
                responses[url]?.append(onComplete)
                return
            } else {
                responses[url] = [onComplete]
            }

            guard let data = data,
                  let image = UIImage(data: data),
                  let blocks = self.responses[url] else {
                DispatchQueue.main.async {
                    onComplete(nil)
                }
                return
            }

            cache.setObject(image, forKey: url.absoluteString as NSString)

            for block in blocks {
                DispatchQueue.main.async {
                    block(image)
                }
            }
        }
        task.resume()
    }
}
