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
    
    @State private var stepperVal = 1
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                // Picture
                Image(menuItem.picture)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 340)
                
                // Title
                Text(menuItem.title)
                    .foregroundColor(Color("Green"))
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                
                VStack {
                    // Description
                    VStack {
                        HStack {
                            Text("Description")
                                .foregroundColor(Color("Green"))
                                .font(.system(size: 20))
                            Spacer()
                        }.padding(.bottom, 11)
                        Text("Donec sed placerat diam. Integer dictum sed est in luctus. Sed sit amet leo congue, feugiat ante et.")
                            .foregroundColor(Color("PaleGreen"))
                            .font(.system(size: 15))
                    }.padding(.vertical)
                    
                    // Ingredients
                    VStack {
                        HStack {
                            Text("Ingredients")
                                .foregroundColor(Color("Green"))
                                .font(.system(size: 20))
                            Spacer()
                        }.padding(.bottom, 11)
                        HStack {
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
                            .foregroundColor(Color("PaleGreen"))
                            .font(.system(size: 15))
                        }
                    }
                    HStack {
                        Stepper("", value: $stepperVal)
                        Text("\(stepperVal)")
                    }
                    
                    ZStack {
                        // Back Rectangle
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color("Yellow"))
                            .frame(maxWidth: 319, maxHeight: 58)
                            .shadow(color: Color("Green"), radius: 1, x: 0, y: 4)
                        
                        // Front Text
                        Text("Add 1 to cart - £10")
                            .fontWeight(.regular)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                        
                    }.padding(.top)
                }.padding(.horizontal)
                
            }
            // Adding the top "Done" button to dismiss the page
            .toolbar {
                Button {
                    // Allows to dismiss the sheet
                    self.showSheetView = false
                } label: {
                    Text("Cancel")
                        .bold()
                        .foregroundColor(Color("Green"))
                    
                }
            }
        }
        
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    struct MenuItemContainer: View {
        @State private var menuItem = MenuItem(ordersCount: 20, title: "Coffee", menuCategory: .Drink, picture: "drink1", price: 10.99, ingredients: [.Broccoli, .Carrot], orderCount: 10)
        
        var body: some View {
            MenuItemDetailsView(menuItem: $menuItem, showSheetView: .constant(false))
        }
    }
    
    static var previews: some View {
        MenuItemContainer()
    }
}
