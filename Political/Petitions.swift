//
//  Petitions.swift
//  Political
//
//  Created by Prudhvi Gadiraju on 4/24/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import Foundation

struct Petitions: Codable {
    let results: [Petition]
}

struct Petition: Codable {
    let title: String
    let body: String
    let signatureCount: Int
}
