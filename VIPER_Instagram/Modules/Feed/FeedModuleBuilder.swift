

import Foundation

class FeedModuleBuilder {

    static func build() -> FeedViewController {
        let interactor = FeedInteractor()
        let presenter = FeedPresenter(interactor: interactor)
        let controller = FeedViewController(presenter: presenter)
        presenter.view = controller
        interactor.presenter = presenter
        return controller
    }

}
