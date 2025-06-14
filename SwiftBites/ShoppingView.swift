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
    
    var body: some View {
        let descriptor = FetchDescriptor<Ingredient>()
        let fetchedResults = try? context.fetch(descriptor)
        let ingredients: [Ingredient] = fetchedResults ?? []
        let shoppingList = ingredients.filter( { $0.isInPantry == false } )
        
        VStack {
            if !shoppingList.isEmpty {
                Text("Shopping List")
                    .font(.title.bold())
                List(shoppingList) { ingredient in
                    Text(ingredient.name)
                }
            } else {
                Text("Pantry is Fully Stocked!")
            }
        }
    }
}

#Preview {
    ShoppingView()
}
