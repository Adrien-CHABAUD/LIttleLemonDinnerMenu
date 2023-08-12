//
//  MenuItemView.swift
//  LIttleLemonDinnerMenu
//
//  Created by Adrien CHABAUD on 2023-07-19.
//

import SwiftUI

// Define how to display each item in the grid
struct MenuItemView: View {
    @Binding var menuItem: MenuItem
    @State private var loved = false
    
    var body: some View {
        ZStack {
            VStack {
                // Background Color
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("PaleGreen"))
                .shadow(radius: 1, y:4)

            }
            
            VStack {
                // Price Display
                Text("\(menuItem.displayPrice)")
                    .frame(maxWidth: 49, maxHeight: 27)
                    .foregroundColor(Color("Yellow"))
                    .background(
                        // Create the background shape
                        RoundedCornerShape(corners: [.topRight, .bottomLeft], radius: 16)
                            .fill(Color("Green"))
                    )
                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                    
                
                
                // Picture with the title
                Image(menuItem.picture)
                    .resizable()
                    .cornerRadius(16.0)
                    .frame(
                        maxWidth: 102,
                        maxHeight: 112
                    )
                    .shadow(color: Color("Green"), radius:1, y: 4)
                
                Text(menuItem.title)
                    .foregroundColor(Color("Green"))
                
                HStack {
                    // Bottom Buttons
                    Button {
                        // Allows to change the UI of the heart
                        self.loved.toggle()
                    } label: {
                        Image(systemName: loved ? "heart.fill" : "heart")
                            .foregroundColor(loved ? .red : Color("Green"))
                    }

                    Spacer()
                        .frame(width: 65)
                    Button {
                        // TO-DO
                    } label: {
                        Text("Add")
                            .underline()
                            .foregroundColor(Color("Yellow"))
                            .fontWeight(.semibold)
                    }
                }
                .padding(.bottom, 5)
            }
        }
        .frame(
            maxWidth: 160,
            maxHeight: 202
        )
        
        
    }
    
}

struct MenuItemView_Previews: PreviewProvider {
    struct MenuItemViewContainer: View {
        @State private var menuItem = MenuItem(ordersCount: 20, title: "Coffee", menuCategory: .Drink, picture: "drink1", price: 10, ingredients: [.Broccoli], orderCount: 10)
        
        var body: some View {
            MenuItemView(menuItem: $menuItem)
        }
    }
    
    static var previews: some View {
        MenuItemViewContainer()
    }
}
