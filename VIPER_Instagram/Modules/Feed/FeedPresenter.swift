
import UIKit
protocol FeedPresenterProtocol: AnyObject {
    var interactor: FeedInteractorProtocol { get }
    func addPhotos()
    func fetchPhotos(posts: [Post])
}

class FeedPresenter: FeedPresenterProtocol {
  
    weak var view: FeedViewProtocol?
    
    let interactor: FeedInteractorProtocol

    init(interactor: FeedInteractorProtocol) {
        self.interactor = interactor
    }
    
    // FROM VIEW
    func addPhotos() {
        interactor.getPosts()
        print("In Presentor --- addPhotos")
    }
    
    // TO VIEW
    func fetchPhotos(posts: [Post]) {
        view?.showDownloadedPosts(posts: posts)
        print("In Presentor --- fetchPhotos - command view.showdowloaded... photosCount = \(posts.count)")
    }

}
