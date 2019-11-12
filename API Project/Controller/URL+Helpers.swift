//
//  URL+Helpers.swift
//  API Project
//
//  Created by Josh GImenes on 11/11/19.
//  Copyright © 2019 Josh Gimenes. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self,
                                       resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
