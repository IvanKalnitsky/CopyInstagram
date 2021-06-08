
import UIKit

protocol FeedPresenterProtocol: AnyObject {
    
    var interactor: FeedInteractorProtocol { get }
    
    func needPosts()
    
    func fetchPosts(posts: [Post])
}

class FeedPresenter: FeedPresenterProtocol {
    
    weak var view: FeedViewProtocol?
    
    let interactor: FeedInteractorProtocol
    
    init(interactor: FeedInteractorProtocol) {
        self.interactor = interactor
    }
    
    // FROM VIEW
    func needPosts() {
        interactor.getPosts()
    }
    
    // TO VIEW
    func fetchPosts(posts: [Post]) {
        view?.showDownloadedPosts(posts: posts)
    }
}
