//
//  APIManager.swift
//  VIPER_Instagram
//
//  Created by macbookp on 24.05.2021.
//

import Foundation

import UIKit

class ApiManager {
    
    static let shared = ApiManager()
    
    func getDogs(completion: @escaping (Dog) -> Void) {
        var request = URLRequest(url: URL(string: "https://dog.ceo/api/breeds/image/random")!)
        request.allHTTPHeaderFields = ["authToken" : "nil"]
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let dog = try? JSONDecoder().decode(Dog.self, from: data) {
                completion(dog)
            } 
        }
        task.resume()
    }
    
    func getImage(from string: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: string) else { return }
        var image: UIImage? = nil
        do {
            let data = try Data(contentsOf: url, options: [])
            image = UIImage(data: data)
            completion(image)
        }
        catch {
            completion(nil)
        }
    }
}
