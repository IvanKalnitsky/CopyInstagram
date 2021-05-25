
import UIKit
protocol PresenterProtocol: AnyObject {
    var interactor: InteractorProtocol { get }
    func addPhotos(number: Int)
    func fetchPhotos(photos: [String])
}

class FeedPresenter: PresenterProtocol {
  
    weak var view: ViewProtocol?
    
    let interactor: InteractorProtocol

    init(interactor: InteractorProtocol) {
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
