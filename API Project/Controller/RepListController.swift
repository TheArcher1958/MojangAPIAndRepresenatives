//
//  PokemonListConroller.swift
//  PokeAPI
//
//  Created by Josh GImenes on 11/11/19.
//  Copyright © 2019 Josh Gimenes. All rights reserved.
//

import Foundation

enum RepListError: Error {
    case failed
}

protocol RepListController {
    func getRepList(zip: String, completion: @escaping (Result<RepList, RepListError>) -> Void)
}
