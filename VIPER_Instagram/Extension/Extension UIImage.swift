//
//  Extension UIImage.swift
//  VIPER_Instagram
//
//  Created by macbookp on 25.05.2021.
//

import UIKit

extension UIImage {
    
    static var logo: UIImage { UIImage(named: "logo")! }
    
    // MARK: Feed Images
    static var direct: UIImage { UIImage(named: "DirectFeed")! }
    static var user: UIImage { UIImage(named: "userFeed")! }
    static var like: UIImage { UIImage(named: "LikeFeed")! }
    static var commentButtonImage: UIImage { UIImage(named: "CommentFeed")!}
    static var shareButtonImage: UIImage { UIImage(named: "AirplaneFeed")! }
    static var bookmarkButtonImage: UIImage { UIImage(named: "BookmarkFeed")! }
    static var noPhoto: UIImage { UIImage(named: "noPhotosFeed")! }
    static var message: UIImage { UIImage(named: "FeedMessage")!}
    static var tochki: UIImage { UIImage(named: "tochki")!}
    
    // MARK: Profile Images
    static var menu: UIImage { UIImage(named: "menuProfile")! }
    static var addPhotoProfile: UIImage { UIImage(named: "addPhotoProfile")! }
    static var userProfile: UIImage { UIImage(named: "userProfile")! }
    static var storieProfile: UIImage { UIImage(named: "storieProfile")! }
    static var feedProfile: UIImage { UIImage(named: "feedProfile")! }
    static var taggedPhotoProfile: UIImage { UIImage(named: "taggedPhotoProfile")! }

    // MARK: Tabs
    static var feedTab: UIImage { UIImage(named: "feedTabImage")!}
    static var searchTab: UIImage { UIImage(named: "searchTabImage")!}
    static var addPhotoTab: UIImage { UIImage(named: "addPhotoTabImage")!}
    static var likesTab: UIImage { UIImage(named: "likesTabImage")!}
    static var profileTab: UIImage { UIImage(named: "profileTabImage")!}
    static var profileNoSelectionTab: UIImage { UIImage(named: "userNoSelectionTabImage")!}
}
