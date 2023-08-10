//
//  MenuItemsView.swift
//  LIttleLemonDinnerMenu
//
//  Created by Adrien CHABAUD on 2023-07-02.
//

import SwiftUI

struct MenuView: View {
    // Get direct access to the data
    @State var showSheetView = false
    @State var selectionCat = "All Categories"
    @State var selectioSort =  "Most Popular"
    //case MostPopular = "Most Popular"
    //case Price = "Price"
    //case Alphabet = "A-Z"
    
    var body: some View {
        
        NavigationView {
            // Overlay the "View Cart" button and the content of the view
            ZStack(alignment: .bottom) {
                ScrollView {
                    
                    switch selectionCat {
                    case "Food":
                        GridItemDisplay(category: "Food")
                    case "Drink":
                        GridItemDisplay(category: "Drink")
                    case "Dessert":
                        GridItemDisplay(category: "Dessert")
                    default:
                        
                        GridItemDisplay(category: "Food")
                        GridItemDisplay(category: "Drink")
                        GridItemDisplay(category: "Dessert")
                    }
                }.navigationTitle("Menu")
                    .toolbar {
                        Button {
                            self.showSheetView.toggle()
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                        }
                        
                        
                    }
                
                // Button allowing to see the cart
                Button {
                    // TO-DO
                } label: {
                    ZStack {
                        // Back Rectangle
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color("Yellow"))
                            .frame(maxWidth: 319, maxHeight: 58)
                            .shadow(color: Color("Green"), radius: 1, x: 0, y: 4)
                        
                        // Front Text
                        Text("View Cart")
                            .fontWeight(.regular)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                        
                    }
                }
            }
        }.sheet(isPresented: $showSheetView) {
            MenuItemsOptionView(showSheetView: self.$showSheetView, selectionCat: self.$selectionCat, selectioSort: self.$selectioSort)
            
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct GridItemDisplay: View {
    @ObservedObject private var viewModel = MenuViewModel()
    // Name of the category
    let category: String
    // Set the size of the grid
    private let gridShape = [
        GridItem(.flexible(), spacing: -30),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack {
            Text(category)
                .font(.system(size: 25))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            // Show the item asked only
            let itemToShow = category == "Food" ? $viewModel.foodMenuItems : category == "Drink" ? $viewModel.drinkMenuItems : $viewModel.dessertMenuItems
            
            LazyVGrid(columns: gridShape) {
                ForEach(itemToShow) { menuItem in
                    NavigationLink {
                        MenuItemDetailsView(menuItem: menuItem)
                    } label: {
                        MenuItemView(menuItem: menuItem)
                        
                    }.buttonStyle(.plain)
                }
            }
        }
        
    }
}
