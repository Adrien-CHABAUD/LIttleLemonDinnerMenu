//
//  MenuItemsView.swift
//  LIttleLemonDinnerMenu
//
//  Created by Adrien CHABAUD on 2023-07-02.
//

import SwiftUI

struct MenuItemsView: View {
    // Get direct access to the data
    let food = MenuItem.examples
    @State var showSheetView = false
    @State var selectionCat = "All Categories"
    @State var selectioSort =  "Most Popular"
//case MostPopular = "Most Popular"
//case Price = "Price"
//case Alphabet = "A-Z"
    
    var body: some View {
        // Divide each category into different variables
        let dishes = food.filter(){ $0.menyCategory == .Food}
        let drinks = food.filter(){ $0.menyCategory == .Drink}
        let desserts = food.filter(){ $0.menyCategory == .Dessert}
        
        
        NavigationView {
            ScrollView {
                
                switch selectionCat {
                case "Food":
                    GridItemDisplay(itemDisplay: dishes,
                                    category: "Food")
                case "Drink":
                    GridItemDisplay(itemDisplay: drinks,
                                    category: "Drink")
                case "Dessert":
                    GridItemDisplay(itemDisplay: desserts,
                                    category: "Dessert")
                default:
                    
                    GridItemDisplay(itemDisplay: dishes,
                                    category: "Food")
                    GridItemDisplay(itemDisplay: drinks,
                                    category: "Drink")
                    GridItemDisplay(itemDisplay: desserts,
                                    category: "Dessert")
                }
            }.navigationTitle("Menu")
                .toolbar {
                    Button {
                        self.showSheetView.toggle()
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                    
                    
                }
        }.sheet(isPresented: $showSheetView) {
            MenuItemsOptionView(showSheetView: self.$showSheetView, selectionCat: self.$selectionCat, selectioSort: self.$selectioSort)
            
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}

struct GridItemDisplay: View {
    // Get the items to display
    let itemDisplay: [MenuItem]
    // Name of the category
    let category: String
    // Set the size of the grid
    private let gridShape = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        VStack {
            Text(category)
                .font(.system(size: 25))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            LazyVGrid(columns: gridShape) {
                ForEach(itemDisplay) { item in
                    VStack {
                        NavigationLink {
                            MenuItemDetailsView(menuItem: item)
                        } label: {
                            Image(item.picture)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(20)
                            
                        }
                        Text(item.title)
                    }
                }
            }
        }
    }
}
