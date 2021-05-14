

import Foundation

class ModuleBuilder {

    static func build() -> ModuleViewController {
        let interactor = Interactor()
        let presenter = Presenter(interactor: interactor)
        let controller = ModuleViewController(presenter: presenter)
        presenter.view = controller
        interactor.presenter = presenter
        return controller
    }

}
