//
//  AppModels.swift
//  SwiftBites
//
//  Created by Kevin James on 6/11/25.
//

import Foundation
import SwiftData

@Model
class Ingredient: Identifiable {
    var id: UUID
    @Attribute(.unique) var name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}

@Model
class RecipeIngredient: Identifiable {
    var id: UUID
    var ingredient: Ingredient
    var quantity: String
    
    init(id: UUID = UUID(), ingredient: Ingredient, quantity: String) {
        self.id = id
        self.ingredient = ingredient
        self.quantity = quantity
    }
}

@Model
class Recipe: Identifiable {
    var id: UUID
    @Attribute(.unique) var name: String
    var summary: String
    
    @Relationship(deleteRule: .nullify, inverse: \Category.recipes)
    var category: Category? = nil
    
    var serving: Int
    var time: Int
    var ingredients: [RecipeIngredient]
    var instructions: String
    var imageData: Data?
    
    init(id: UUID = UUID(),
         name: String,
         summary: String,
         category: Category? = nil,
         serving: Int = 1,
         time: Int = 5,
         ingredients: [RecipeIngredient],
         instructions: String,
         imageData: Data? = nil
    ) {
        self.id = id
        self.name = name
        self.summary = summary
        self.category = category
        self.serving = serving
        self.time = time
        self.ingredients = ingredients
        self.instructions = instructions
        self.imageData = imageData
    }
}

@Model
class Category: Identifiable {
    var id: UUID
    @Attribute(.unique) var name: String
    
    @Relationship
    var recipes: [Recipe]
    
    init(id: UUID = UUID(), name: String, recipes: [Recipe] = []) {
        self.id = id
        self.name = name
        self.recipes = recipes
    }
}
