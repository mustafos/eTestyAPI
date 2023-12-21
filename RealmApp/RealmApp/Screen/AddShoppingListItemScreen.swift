//
//  AddShoppingListItemScreen.swift
//  RealmApp
//
//  Created by Mustafa Bekirov on 18.12.2023.
//

import SwiftUI
import RealmSwift

struct AddShoppingListItemScreen: View {
    
    @ObservedRealmObject var shoppingList: ShoppingList
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AddShoppingListItemScreen(shoppingList: ShoppingList())
}
