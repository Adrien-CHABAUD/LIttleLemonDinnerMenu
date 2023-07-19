//
//  MenuItemDetailsView.swift
//  LIttleLemonDinnerMenu
//
//  Created by Adrien CHABAUD on 2023-07-02.
//

import SwiftUI

struct MenuItemDetailsView: View {
    let menuItem: MenuItem
    
    var body: some View {
        
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
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let test = MenuItem(title: "coffee", picture: "drink1", price: 12.5, ingredients: [.Broccoli, .TomatoSauce], menyCategory: .Drink, orderCount: 30)
        MenuItemDetailsView(menuItem: test)
    }
}
