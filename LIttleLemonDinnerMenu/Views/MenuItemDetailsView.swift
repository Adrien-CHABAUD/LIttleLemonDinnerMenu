//
//  MenuItemDetailsView.swift
//  LIttleLemonDinnerMenu
//
//  Created by Adrien CHABAUD on 2023-07-02.
//

import SwiftUI

struct MenuItemDetailsView: View {
    // Item to display
    @Binding var menuItem: MenuItem
    // Contains whether the page should be shown
    @Binding var showSheetView: Bool
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                Image("littleLemonLogo")
                    .resizable()
                    .frame(maxWidth: 225, maxHeight: 340)
                Text("Price:")
                    .fontWeight(.bold)
                Text("$" + String(menuItem.price))
                Text("Ordered:")
                    .fontWeight(.bold)
                Text("\(menuItem.orderCount)")
                Text("Ingredients:")
                    .fontWeight(.bold)
                ForEach(menuItem.ingredients, id: \.self) { item in
                    switch item {
                    case .Broccoli:
                        Text("Broccoli")
                    case .Carrot:
                        Text("Carrot")
                    case .Pasta:
                        Text("Pasta")
                    case .TomatoSauce:
                        Text("Tomato Sauce")
                    case .Spinach:
                        Text("Spinach")
                    }
                }
            }
            // Adding the top "Done" button to dismiss the page
            .toolbar {
                Button {
                    // Allows to dismiss the sheet
                    self.showSheetView = false
                } label: {
                    Text("Done").bold()
                }
            }
        }

    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    struct MenuItemContainer: View {
        @State private var menuItem = MenuItem(ordersCount: 20, title: "Coffee", menuCategory: .Drink, picture: "drink1", price: 10.99, ingredients: [.Broccoli], orderCount: 10)
        
        var body: some View {
            MenuItemDetailsView(menuItem: $menuItem, showSheetView: .constant(false))
        }
    }
    
    static var previews: some View {
        MenuItemContainer()
    }
}
