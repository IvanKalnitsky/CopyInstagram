

import Foundation

class ProfileModuleBuilder {

    static func build() -> ProfileModuleViewController {
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(interactor: interactor)
        let controller = ProfileModuleViewController(presenter: presenter)
        presenter.view = controller
        interactor.presenter = presenter
        return controller
    }

}
