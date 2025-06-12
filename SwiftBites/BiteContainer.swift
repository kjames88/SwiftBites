//
//  BiteContainer.swift
//  SwiftBites
//
//  Created by Kevin James on 6/11/25.
//

import Foundation
import SwiftData
import SwiftUI

actor BiteContainer {
    @MainActor
    static func create() -> ModelContainer {
        let schema = Schema([Category.self, Ingredient.self, Recipe.self, RecipeIngredient.self])
        let configuration = ModelConfiguration()
        
        let container = try! ModelContainer(for: schema, configurations: configuration)
        
        return container
    }
}
