//
//  MenuItemsView.swift
//  LIttleLemonDinnerMenu
//
//  Created by Adrien CHABAUD on 2023-07-02.
//

import SwiftUI

struct MenuView: View {
    // Get direct access to the data
    @State var selectionCat = "All Categories"
    @State var selectioSort =  "Most Popular"
    
    // Variables used by the display to display the items
    @State private var foodSelected = true
    @State private var drinkSelected = false
    @State private var dessertSelected = false
    
    var body: some View {
        
        NavigationView {
            // Overlay the "View Cart" button and the content of the view
            ZStack(alignment: .bottom) {
                ScrollView {
                    
                    // Buttons allowing the selection of the content to display
                    HStack {
                        
                        // Main button
                        MenuCategoryButton(icon: "fork.knife.circle.fill", name: "Main", selectedCategory: $foodSelected, mainCat: $foodSelected, drinkCat: $drinkSelected, DessertCat: $dessertSelected )
                        
                        // Drinks button
                        MenuCategoryButton(icon: "cup.and.saucer.fill", name: "Drinks", selectedCategory: $drinkSelected, mainCat: $foodSelected, drinkCat: $drinkSelected, DessertCat: $dessertSelected )
                        .padding(.horizontal)
                        
                        // Desserts button
                        MenuCategoryButton(icon: "birthday.cake.fill", name: "Desserts", selectedCategory: $dessertSelected, mainCat: $foodSelected, drinkCat: $drinkSelected, DessertCat: $dessertSelected )
                    }
                    .padding(.top)
                    .padding(.bottom)
                    
//MARK: - Switch data display
                    // Display the item in the view
                    if foodSelected {
                        GridItemDisplay(category: "Food")
                    } else if drinkSelected {
                        GridItemDisplay(category: "Drink")
                    } else {
                        GridItemDisplay(category: "Dessert")
                    }
                    
                    // Add space so the cart button is not on top of
                    // card at the bottom of the scrollView.
                    Spacer(minLength: 70)

                }
                .toolbar {
                    // Adding the name of the app on the leading side
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Little Lemon")
                            .fontWeight(.bold)
                            .foregroundColor(Color("Green"))
                            .font(.system(size: 24))
                    }
                    // Shows the account button in the toolbar
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
                            // NOT IMPLEMENTED
                        } label: {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.system(size: 25))
                                .foregroundColor(Color("Green"))
                        }
                        
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
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

//MARK: - GRID DISPLAY
//Display the gridItems
struct GridItemDisplay: View {
    @ObservedObject private var viewModel = MenuViewModel()
    // Deciding if the sheet should be displayed or not
    @State var showSheetView = false
    let category: String
    // Set the size of the grid
    private let gridShape = [
        GridItem(.flexible(), spacing: -30),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack {
            
            // Show the item asked only
            let itemToShow = category == "Food" ? $viewModel.foodMenuItems : category == "Drink" ? $viewModel.drinkMenuItems : $viewModel.dessertMenuItems
            
            LazyVGrid(columns: gridShape) {
                ForEach(itemToShow) { menuItem in
                    Button {
                        // Present sheet
                        self.showSheetView.toggle()
                    } label: {
                        MenuItemView(menuItem: menuItem)
                    }
                    .sheet(isPresented: $showSheetView) {
                        // Display the detail view as a sheet
                        MenuItemDetailsView(menuItem: menuItem,showSheetView: self.$showSheetView)
                    }
                }
            }
        }
        
    }
}
