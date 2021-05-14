

import UIKit

protocol InteractorProtocol: class {
   func fetchNumbers()
}


class Interactor: InteractorProtocol {
    
    weak var presenter: PresenterProtocol?
    
    func fetchNumbers() {
        presenter?.fetchNumbers(numbers: Model.numeration)
    }
}
