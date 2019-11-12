//
//  PokemonListNetworkController.swift
//  PokeAPI
//
//  Created by Josh GImenes on 11/8/19.
//  Copyright © 2019 Josh Gimenes. All rights reserved.
//

import Foundation

class RepListNetworkController: RepListController {
    let baseURL = URL(string: "https://whoismyrepresentative.com/getall_mems.php?output=json&")!
    let session =  URLSession.shared
    
    
    
    func getRepList(zip: String, completion: @escaping (Result<RepList, RepListError>) -> Void) {
        let query: [String: String] = [
            "zip": zip,
            "output": "json"
        ]
        guard let url = baseURL.withQueries(query) else {
            //completion()
            print("Unable to build URL with supplied queries.")
            return
        }
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else { return completion(.failure(.failed)) }
            
            if (response as? HTTPURLResponse)?.statusCode == 200,
                let data = data {
                let decoder = JSONDecoder()
                
                do {
                    let repList = try decoder.decode(RepList.self, from: data)
                    
                    completion(.success(repList))
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
