

protocol PresenterProtocol: class {
    var interactor: InteractorProtocol { get }
    func addNumbers()
    func fetchNumbers(numbers: [Int])
}

class Presenter: PresenterProtocol {
  
    weak var view: ViewProtocol?
    let interactor: InteractorProtocol

    init(interactor: InteractorProtocol) {
        self.interactor = interactor
    }
    
    
    // FROM VIEW
    func addNumbers() {
        interactor.fetchNumbers()
    }
    
    // TO VIEW
    func fetchNumbers(numbers: [Int]) {
        view?.showDownloadedNumbers(newNumbers: numbers)
    }

}
