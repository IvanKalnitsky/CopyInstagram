
import UIKit
protocol FeedPresenterProtocol: AnyObject {
    var interactor: FeedInteractorProtocol { get }
    func addPhotos(number: Int)
    func fetchPhotos(photos: [String])
}

class FeedPresenter: FeedPresenterProtocol {
  
    weak var view: FeedViewProtocol?
    
    let interactor: FeedInteractorProtocol

    init(interactor: FeedInteractorProtocol) {
        self.interactor = interactor
    }
    
    // FROM VIEW
    func addPhotos(number: Int) {
        interactor.fetchPhotos(number: number)
        print("In Presentor --- addPhotos")
    }
    
    // TO VIEW
    func fetchPhotos(photos: [String]) {
        view?.showDownloadedPhotos(photos: photos)
        print("In Presentor --- fetchPhotos - command view.showdowloaded... photosCount = \(photos.count)")
    }

}
