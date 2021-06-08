//
//  TabBarModuleBuilder.swift
//  VIPER_Instagram
//
//  Created by macbookp on 25.05.2021.
//

import UIKit

class TabBarModuleBuilder {
    static func build(submodules: TabBarRouter.Submodules) -> UITabBarController {
        let tabs = TabBarRouter.tabs(submodules: submodules)
        let tabBarController = TabBarViewController(tabs: tabs)
        return tabBarController
    }
}
