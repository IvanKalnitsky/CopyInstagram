

import UIKit
import SnapKit
import AVFoundation

protocol ProfileViewProtocol: AnyObject {
}

class ProfileViewController: UIViewController, ProfileViewProtocol {

    let presenter: ProfilePresenterProtocol
    init(presenter: ProfilePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("don't use storyboards!")
    }

    //MARK: Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    private func initialize() {
    }

}
