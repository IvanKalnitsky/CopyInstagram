

import UIKit

protocol FeedInteractorProtocol: AnyObject {
    func getPosts()
}


class FeedInteractor: FeedInteractorProtocol {
    
    weak var presenter: FeedPresenterProtocol?
    
    func getPosts() {
        FeeedManager.shared.getDogs { posts in
                self.presenter?.fetchPosts(posts: posts)
            print("posts in GET POSTS INTERACTOR = \(posts.count)")
        }
    }
}


