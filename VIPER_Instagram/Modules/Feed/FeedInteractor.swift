

import UIKit

protocol FeedInteractorProtocol: AnyObject {
    func fetchPhotos(number: Int)
}


class FeedInteractor: FeedInteractorProtocol {
    
    weak var presenter: FeedPresenterProtocol?
    
    var photoDownloaded = [String]()
    
    
    func fetchPhotos(number: Int) {
        var newPhoto = [String]()
        ApiManager.shared.getDogs { dog in
            print(dog.message)
            newPhoto.append(dog.message)
            print("DownloadedPhoto in COMPLETION  =  \(newPhoto.count)")
            DispatchQueue.main.async {
                self.presenter?.fetchPhotos(photos: newPhoto)
            }
        }
    }
}
