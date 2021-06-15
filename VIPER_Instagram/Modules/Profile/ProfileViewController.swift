

import UIKit
import SnapKit
import AVFoundation

protocol ProfileViewProtocol: AnyObject {
    
}

class ProfileViewController: UIViewController, ProfileViewProtocol{

    let presenter: ProfilePresenterProtocol
    init(presenter: ProfilePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("don't use storyboards!")
    }

    //MARK: CreateViews:
    
    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "user_name"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        return label
    }()
    
    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.axis = .horizontal
        
        let plusPhotoButton = UIButton()
        plusPhotoButton.setImage(UIImage.addPhotoProfile, for: .normal)
        
        let menuProfileButton = UIButton()
        menuProfileButton.setImage(UIImage.menu, for: .normal)
        
        stackView.addArrangedSubview(plusPhotoButton)
        stackView.addArrangedSubview(menuProfileButton)
        return stackView
    }()
    
    //MARK: Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    private func initialize() {
        view.backgroundColor = .white
        
        self.view.addSubview(topView)
        topView.snp.makeConstraints { maker in
            maker.left.top.right.equalToSuperview()
            maker.height.equalTo(100)
            
            topView.addSubview(nameLabel)
            nameLabel.snp.makeConstraints { maker in
                maker.bottom.equalToSuperview().inset(10)
                maker.left.equalToSuperview().inset(20)
            }
            
            topView.addSubview(topStackView)
            topStackView.snp.makeConstraints { maker in
                maker.right.equalToSuperview().inset(20)
                maker.centerY.equalTo(nameLabel.snp.centerY)
                maker.height.equalTo(20)
                maker.width.equalTo(50)
            }
        }
        let profileInfoView = ProfileInfoView(delegate: self)
        view.addSubview(profileInfoView)
        profileInfoView.snp.makeConstraints { maker in
            maker.centerX.centerY.equalToSuperview()
            maker.leading.trailing.equalToSuperview()
            maker.height.equalTo(100)
        }
    }
}


extension ProfileViewController: ProfileInfoProtocol {
    
    func didProfileButtonTapped() {
        print("Button tapped")
    }

}
