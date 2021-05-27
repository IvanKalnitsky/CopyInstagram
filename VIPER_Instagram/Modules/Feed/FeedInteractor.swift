

import UIKit

protocol FeedInteractorProtocol: AnyObject {
    func getPosts()
}


class FeedInteractor: FeedInteractorProtocol {
    
    weak var presenter: FeedPresenterProtocol?
    
    func getPosts() {
        FeeedManager.shared.getDogs { posts in
                self.presenter?.fetchPhotos(posts: posts)
            print("posts in GET POSTS INTERACTOR = \(posts.count)")
        }
    }
}
//
//    func getPosts() {
//        var newPhoto = [String]()
//        ApiManager.shared.getDogs { dog in
//            print(dog.message)
//            newPhoto.append(dog.message)
//            print("DownloadedPhoto in COMPLETION  =  \(newPhoto.count)")
//            DispatchQueue.main.async {
//                self.presenter?.fetchPhotos(photos: newPhoto)
//            }
//        }
//    }

