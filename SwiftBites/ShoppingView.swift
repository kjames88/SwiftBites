//
//  ShoppingView.swift
//  SwiftBites
//
//  Created by Kevin James on 6/12/25.
//

import SwiftUI
import SwiftData

struct ShoppingView: View {
    @Environment(\.modelContext) var context
    var ingredients: [RecipeIngredient]
    
    var body: some View {
        let shoppingList = ingredients.filter( { $0.ingredient.isInPantry == false } )
        
        if !shoppingList.isEmpty {
                List(shoppingList) {recipeIngredient in
                    HStack {
                        Text(recipeIngredient.ingredient.name)
                        Spacer()
                        Button("Buy", action: {recipeIngredient.ingredient.isInPantry = true})
                            .foregroundStyle(.blue)
                    }
                }
                .navigationTitle("Shopping List")
            
        } else {
            Text("Pantry is Fully Stocked!")
        }
    }
}

#Preview {
    ShoppingView(ingredients: [RecipeIngredient(ingredient: Ingredient(name: "Flour"), quantity: "1")])
}
