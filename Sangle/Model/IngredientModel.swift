//
//  IngredientModel.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/22/24.
//

import Foundation

struct IngredientModel: Hashable {
    let name: String
    let category: String
    
    let date: Date?
    
    init(name: String, category: String, date: Date? = nil) {
        self.name = name
        self.category = category
        self.date = date
    }
}
