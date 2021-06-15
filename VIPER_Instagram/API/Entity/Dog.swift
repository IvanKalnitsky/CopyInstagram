//
//  Model.swift
//  VIPER_Instagram
//
//  Created by macbookp on 13.05.2021.
//

import Foundation

import UIKit

// MARK: - Dog
struct Dog: Codable {
    let message: String
    let status: String
}

struct Post {
    let dog: Dog
    let image: UIImage?
}
