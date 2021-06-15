//
//  ProfileInfoView.swift
//  VIPER_Instagram
//
//  Created by macbookp on 12.06.2021.
//
import SnapKit
import UIKit

protocol ProfileInfoProtocol: AnyObject {
    func didProfileButtonTapped()
}

class ProfileInfoView: UIView {
    
    weak var delegate: ProfileInfoProtocol?
    
    init(delegate: ProfileInfoProtocol) {
        self.delegate = delegate
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() {
        let button = UIButton()
        button.backgroundColor = .gray
        addSubview(button)
        button.addTarget(self, action: #selector(didButtonTapped), for: .touchUpInside)
        button.snp.makeConstraints { maker in
            maker.size.equalTo(50)
            maker.center.equalToSuperview()
        }
    }
    
  @objc  func didButtonTapped() {
        delegate?.didProfileButtonTapped()
    }
}
