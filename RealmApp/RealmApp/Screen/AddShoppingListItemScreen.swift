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
    
    @State private var title: String = ""
    @State private var quantity: String = ""
    @State private var selectedCategory: String = ""
    
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let data = ["Produce", "Fruit", "Meet", "Condiments", "Beverages", "Snacks", "Dairy"]
    
    var body: some View {
        NavigationView {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(data, id: \.self) { item in
                        Text(item)
                            .padding()
                            .frame(width: 130)
                            .background(selectedCategory == item ? .orange : .green)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
                            .foregroundStyle(.white)
                            .onTapGesture {
                                selectedCategory = item
                            }
                    }
                }
                Spacer().frame(height: 60)
                TextField("Title", text: $title)
                    .textFieldStyle(.roundedBorder)
                TextField("Quantity", text: $quantity)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    // save the item
                    let shopingItem = ShoppingItem()
                    shopingItem.title = title
                    shopingItem.quantity = Int(quantity) ?? 1
                    shopingItem.category = selectedCategory
                    $shoppingList.items.append(shopingItem)
                    
                    dismiss()
                    
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity, maxHeight: 40)
                }
                .buttonStyle(.bordered)
                .padding(.top, 20)
                Spacer()
                    .navigationTitle("Add Item")
            }
            .padding()
        }
    }
}

#Preview {
    AddShoppingListItemScreen(shoppingList: ShoppingList())
}
