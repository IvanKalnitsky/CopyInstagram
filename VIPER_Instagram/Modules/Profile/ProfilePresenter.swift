

protocol ProfilePresenterProtocol: AnyObject {
    var interactor: ProfileInteractorProtocol { get }
}

class ProfilePresenter: ProfilePresenterProtocol {

    weak var view: ProfileViewProtocol?
    let interactor: ProfileInteractorProtocol

    init(interactor: ProfileInteractorProtocol) {
        self.interactor = interactor
    }

}
