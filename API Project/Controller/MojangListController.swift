//
//  PokemonListConroller.swift
//  PokeAPI
//
//  Created by Josh GImenes on 11/11/19.
//  Copyright © 2019 Josh Gimenes. All rights reserved.
//

import Foundation

enum MojangListError: Error {
    case failed
}

protocol MojangListController {
    func getMojangList(username: String, completion: @escaping (Result<MojangListItem, MojangListError>) -> Void)
}
