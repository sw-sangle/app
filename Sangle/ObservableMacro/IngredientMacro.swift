//
//  IngredientMacro.swift
//  Sangle
//
//  Created by  jwkwon0817 on 11/24/24.
//

import Foundation
import Observation

@Observable
class IngredientMacro {
    var data: [IngredientModel] = [
        IngredientModel(name: "고구마", category: "채소", date: Date.from(year: 2024, month: 9, day: 21), expirationDate: Date.from(year: 2024, month: 11, day: 27)),
        IngredientModel(name: "양배추", category: "채소", date: Date.from(year: 2024, month: 9, day: 22), expirationDate: Date.from(year: 2024, month: 11, day: 29)),
        IngredientModel(name: "감자", category: "채소", date: Date.from(year: 2024, month: 9, day: 23), expirationDate: Date.from(year: 2024, month: 12, day: 1)),
        IngredientModel(name: "당근", category: "채소", date: Date.from(year: 2024, month: 9, day: 24), expirationDate: Date.from(year: 2024, month: 12, day: 5))
    ]
}
