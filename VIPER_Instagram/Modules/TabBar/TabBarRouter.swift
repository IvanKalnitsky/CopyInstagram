//
//  TabBarRouter.swift
//  VIPER_Instagram
//
//  Created by macbookp on 25.05.2021.
//

import UIKit

class TabBarRouter {
    
    var viewController: UIViewController
    
    typealias Submodules = (
        feed: UIViewController,
        profile: UIViewController
    )
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}


extension TabBarRouter {
    
    static func tabs(submodules: Submodules) -> InstagramTabs {
        
        let feedTabBarItem = UITabBarItem(title: "",
                                          image: UIImage.feedTab,
                                          selectedImage: nil)
        
        let profileTabBarItem = UITabBarItem(title: "",
                                             image: UIImage.profileNoSelectionTab.withRenderingMode(.alwaysOriginal),
                                             selectedImage: UIImage.profileTab.withRenderingMode(.alwaysOriginal))

        submodules.feed.tabBarItem = feedTabBarItem
        submodules.profile.tabBarItem = profileTabBarItem
        
        return (
            feed: submodules.feed,
            profile: submodules.profile
        )
    }
}
