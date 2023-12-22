//
//  ShoppingListItemsScreen.swift
//  RealmApp
//
//  Created by Mustafa Bekirov on 18.12.2023.
//

import SwiftUI
import RealmSwift

struct ShoppingListItemsScreen: View {
    
    @ObservedRealmObject var shoppingList: ShoppingList
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            List {
                ForEach(shoppingList.items) { item in
                    Text(item.title)
                }
            }
            .navigationTitle(shoppingList.title)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    // action
                    isPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            AddShoppingListItemScreen(shoppingList: shoppingList)
        }
    }
}

#Preview {
    NavigationView {
        ShoppingListItemsScreen(shoppingList: ShoppingList())
    }
}
