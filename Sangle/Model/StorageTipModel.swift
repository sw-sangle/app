//
//  StorageTipModel.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/24/24.
//

import Foundation

struct StorageTipModel: Hashable {
    let type: StorageTipsPath
    let image: String
    let title: String
    let description: String
    let extra: [String]
}
