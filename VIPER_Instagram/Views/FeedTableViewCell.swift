//
//  FeedTableViewCell.swift
//  VIPER_Instagram
//
//  Created by macbookp on 14.05.2021.
//

import UIKit
import SnapKit
class FeedTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    let backView: UIView = {
        var view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // backView
        addSubview(backView)
        backView.snp.makeConstraints { maker in
            maker.left.top.right.equalToSuperview()
            maker.height.equalTo(100)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
