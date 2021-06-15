//
//  FeedTableViewCell.swift
//  VIPER_Instagram
//
//  Created by macbookp on 14.05.2021.
//
import SnapKit
import UIKit

class FeedTableViewCell: UITableViewCell {

    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let photoImage: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let avatarProfileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.user, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let nameProfileButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("name_of_user", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        return button
    }()
    
    private let optionImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.tochki, for: .normal)
        return button
    }()

    private let lmdStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.axis = .horizontal
        
        let likeButton = UIButton()
        likeButton.setImage(UIImage.like, for: .normal)
        
        let messegeButton = UIButton()
        messegeButton.setImage(UIImage.commentButtonImage, for: .normal)

        let directButton = UIButton()
        directButton.setImage(UIImage.direct, for: .normal)
        
        stack.addArrangedSubview(likeButton)
        stack.addArrangedSubview(messegeButton)
        stack.addArrangedSubview(directButton)
        return stack
    }()
    
    private let likeLabel: UILabel = {
        let label = UILabel()
        label.text = "Нравится: 100"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private let bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage.bookmarkButtonImage, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(post: Post) {
        self.photoImage.image = post.image
    }
    
   private func initialize() {
    
        //MARK: - TOPVIEW CONSTRAINTS
        addSubview(topView)
        topView.snp.makeConstraints { maker in
            maker.left.top.right.equalToSuperview()
            maker.height.equalTo(70)
        }

        topView.addSubview(avatarProfileButton)
        avatarProfileButton.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.left.equalTo(10)
            maker.width.height.equalTo(40)
        }
        topView.addSubview(nameProfileButton)
        nameProfileButton.snp.makeConstraints { maker in
            maker.left.equalTo(avatarProfileButton.snp.right).inset(-10)
            maker.centerY.equalTo(avatarProfileButton)
        }

        topView.addSubview(optionImageButton)
        optionImageButton.snp.makeConstraints { maker in
            maker.right.equalToSuperview().inset(20)
            maker.centerY.equalToSuperview()
            maker.height.width.equalTo(25)
        }

        //MARK: - PHOTOIMAGE CONSTRAINTS
        addSubview(photoImage)
        photoImage.snp.makeConstraints { maker in
            maker.top.equalTo(topView.snp.bottom)
            maker.height.equalTo(500)
            maker.left.right.equalToSuperview()
        }

        //MARK: - BottomView CONSTRAINTS
        addSubview(bottomView)
        bottomView.snp.makeConstraints { maker in
            maker.top.equalTo(photoImage.snp.bottom)
            maker.left.right.equalToSuperview()
            maker.height.equalTo(100)
            maker.bottom.equalToSuperview()
        }

        bottomView.addSubview(lmdStackView)
        lmdStackView.snp.makeConstraints { maker in
            maker.left.equalTo(15)
            maker.top.equalToSuperview().inset(10)
            maker.height.equalTo(30)
            maker.width.equalTo(110)
        }

        bottomView.addSubview(bookmarkButton)
        bookmarkButton.snp.makeConstraints { maker in
            maker.centerY.equalTo(lmdStackView.snp.centerY)
            maker.right.equalToSuperview().inset(20)
            maker.width.height.equalTo(lmdStackView.snp.height)
        }
        bottomView.addSubview(likeLabel)
        likeLabel.snp.makeConstraints { maker in
            maker.left.equalTo(lmdStackView.snp.left)
            maker.top.equalTo(lmdStackView.snp.bottom).inset(-10)
        }
    }
}
