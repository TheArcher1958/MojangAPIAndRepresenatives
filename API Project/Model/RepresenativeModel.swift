//
//  RepresenativeModel.swift
//  API Project
//
//  Created by Josh GImenes on 11/11/19.
//  Copyright © 2019 Josh Gimenes. All rights reserved.
//

import Foundation

struct RepList: Codable {
    let results: [RepListItem]
}

struct RepListItem: Codable {
    let name: String
    let party: String
    let state: String
    let phone: String
    let link: URL
}
