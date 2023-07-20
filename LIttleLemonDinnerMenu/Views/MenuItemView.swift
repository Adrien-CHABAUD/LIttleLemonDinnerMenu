//
//  MenuItemView.swift
//  LIttleLemonDinnerMenu
//
//  Created by Adrien CHABAUD on 2023-07-19.
//

import SwiftUI

struct MenuItemView: View {
    @Binding var menuItem: MenuItem
    var body: some View {
        VStack {
            Image(menuItem.picture)
                .resizable()
                .frame(
                    maxWidth: 100,
                    maxHeight: 100
                )
            Text(menuItem.title)
        }
    }
}

struct MenuItemView_Previews: PreviewProvider {
    struct MenuItemViewContainer: View {
        @State private var menuItem = MenuItem(ordersCount: 20, title: "Coffee", menuCategory: .Drink, picture: "drink1", price: 10.99, ingredients: [.Broccoli], orderCount: 10)
        
        var body: some View {
            MenuItemView(menuItem: $menuItem)
        }
    }
    
    static var previews: some View {
        MenuItemViewContainer()
    }
}
