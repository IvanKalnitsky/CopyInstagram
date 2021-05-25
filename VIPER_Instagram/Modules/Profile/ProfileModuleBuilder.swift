

import Foundation

class ProfileModuleBuilder {

    static func build() -> ProfileViewController {
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(interactor: interactor)
        let controller = ProfileViewController(presenter: presenter)
        presenter.view = controller
        interactor.presenter = presenter
        return controller
    }

}
