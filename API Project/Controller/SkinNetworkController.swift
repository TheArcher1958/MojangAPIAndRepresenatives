//
//  SkinNetworkController.swift
//  API Project
//
//  Created by Josh GImenes on 11/11/19.
//  Copyright © 2019 Josh Gimenes. All rights reserved.
//

import UIKit

import Foundation

class SkinListNetworkController {
    let baseURL = URL(string: "https://visage.surgeplay.com/full/")!
    let session =  URLSession.shared

    func fetchImage(uuid: String, completion:
        @escaping (UIImage?) -> Void) {
        let url = baseURL.appendingPathComponent(uuid)

        
        
        let imageTask = URLSession.shared.dataTask(with: url) { (data,
            response, error) in
            //let decoder = JSONDecoder()
            if let data = data,
                let image = UIImage(data: data) {
                
                completion(image)
                
                
            } else {
                print("Either no data was returned, or data was not serialized.")
                
                completion(nil)
                return
            }
        }
        
        
        imageTask.resume()
    }
}



