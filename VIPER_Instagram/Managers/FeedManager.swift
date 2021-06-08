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
            print("DogsCount in GetDogs = \(dogs.count)")
            for dog in dogs {
                imageGroup.enter()
                ApiManager.shared.getImage(from: dog.message) { image in
                    print("Image in GetDogs = \(String(describing: image))")
                    let post = Post(dog: dog, image: image)
                    posts.append(post)
                    print("PostsCOunt In GetDogs = \(posts.count)")
                    imageGroup.leave()
                }
            }
            imageGroup.notify(queue: .main) {
                completion(posts)
                print("Posts in COMLETION BLOCK IN GETDOGS = \(posts.count)")
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
