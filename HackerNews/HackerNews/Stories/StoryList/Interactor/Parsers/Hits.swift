//
//  Hits.swift
//  HackerNews
//
//  Created by Carlos Jimenez on 05-09-17.
//  Copyright © 2017 Carlos Jimenez. All rights reserved.
//

import Foundation
import Unbox

struct Hits {
    let hits: [Story]
    let hitsPerPage: Int
}

extension Hits: Unboxable {
    init(unboxer: Unboxer) throws {
        self.hits = try unboxer.unbox(key: "hits")
        self.hitsPerPage = try unboxer.unbox(key: "hitsPerPage")
    }
}
