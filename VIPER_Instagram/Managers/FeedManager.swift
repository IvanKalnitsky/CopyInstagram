//
//  FeedManager.swift
//  VIPER_Instagram
//
//  Created by macbookp on 26.05.2021.
//

import Foundation

class FeeedManager {
    
    static let shared = FeeedManager()
    
    var apiManager = ApiManager.shared
    
    var dbManager = DataBaseManager.shared
    
    func getDogs(completion: @escaping ([Post]) -> Void) {
        var dogs = [Dog]()
        let postsCount = 10
        let group = DispatchGroup()
        
        for _ in 1...postsCount {
            group.enter()
            apiManager.getDogs { dog in
                dogs.append(dog)
                group.leave()
            }
        }
        
        var posts = [Post]()
        let imageGroup = DispatchGroup()
        group.notify(queue: .main) {
            for dog in dogs {
                imageGroup.enter()
                ApiManager.shared.getImage(from: dog.message) { image in
                    let post = Post(dog: dog, image: image)
                    posts.append(post)
                    imageGroup.leave()
                }
            }
            imageGroup.notify(queue: .main) {
                completion(posts)
            }
        }
    }
    
    // Проверка на наличие интернета
    //    func getPosts() {
    //        if Reachability.shared.hasInternetAccess {
    //            apiManager.getDogs { dog in
    //                //dbManager.saveDogToCache(dog: dog)
    //        }
    //        } else {
    //            //dbManager.getDog()
    //        }
    //    }
    
}
