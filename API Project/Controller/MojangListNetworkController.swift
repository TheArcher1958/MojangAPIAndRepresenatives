//
//  MojangListNetworkController.swift
//  API Project
//
//  Created by Josh GImenes on 11/11/19.
//  Copyright © 2019 Josh Gimenes. All rights reserved.
//

import Foundation


//
//  PokemonListNetworkController.swift
//  PokeAPI
//
//  Created by Josh GImenes on 11/8/19.
//  Copyright © 2019 Josh Gimenes. All rights reserved.
//

import Foundation

class MojangListNetworkController: MojangListController {
    let baseURL = URL(string: "https://api.mojang.com/users/profiles/minecraft/")!
    let session =  URLSession.shared
    
    
    
    func getMojangList(username: String, completion: @escaping (Result<MojangListItem, MojangListError>) -> Void) {
        let path = username
        let url = baseURL.appendingPathComponent(path)

        
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else { return completion(.failure(.failed)) }
            if (response as? HTTPURLResponse)?.statusCode == 200,
                let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let mojangListItem = try decoder.decode(MojangListItem.self, from: data)
                    
                    completion(.success(mojangListItem))
                } catch {
                    print(error)
                    completion(.failure(.failed))
                }
                
            } else {
                completion(.failure(.failed))
            }
        }
        task.resume()
    }
}

