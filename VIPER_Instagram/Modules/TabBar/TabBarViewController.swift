//
//  TabBarViewController.swift
//  VIPER_Instagram
//
//  Created by macbookp on 25.05.2021.
//

import UIKit

typealias InstagramTabs = (
    feed: UIViewController,
    profile: UIViewController
)

class TabBarViewController: UITabBarController {
    
    init(tabs: InstagramTabs) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [tabs.feed, tabs.profile]
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .white
        tabBar.tintColor = .black
    }
}
