//
//  MenuItemsOptionView.swift
//  LIttleLemonDinnerMenu
//
//  Created by Adrien CHABAUD on 2023-07-02.
//

import SwiftUI

struct MenuItemsOptionView: View {
    
    // Controls the display of the sheet
    @Binding var showSheetView: Bool
    // Allows to keep the selected items through the views
    @Binding var selectionCat: String
    @Binding var selectioSort: String
    
    // Give raw values to each to reduce the code
    enum selectCategories: String, CaseIterable {
        case selectAll = "All Categories"
        case Food = "Food"
        case Drink = "Drink"
        case Dessert = "Dessert"
    }
    enum sortItem: String, CaseIterable {
        case MostPopular = "Most Popular"
        case Price = "Price"
        case Alphabet = "A-Z"
    }
    
    var body: some View {
        NavigationView {
            Form {
                // Picker corresponding to the SELECTED CATEGORIES
                PickerDisplay(selection: $selectionCat, nameSection: "SELECTED CATEGORIES", categories: selectCategories.allCases.map{ $0.rawValue})
                // Picker corresponding to the SORT BY
                PickerDisplay(selection: $selectioSort, nameSection: "SORT BY", categories: sortItem.allCases.map{ $0.rawValue })
                
            }
            .navigationTitle("Filter")
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


struct MenuItemsOptionView_Previews: PreviewProvider {
    
    // To be able to give binding and see the preview working
    struct BindingTestHolder: View {
        @State var selectionC = "All Categories"
        @State var selectioS =  "Most Popular"
            var body: some View {
                MenuItemsOptionView(showSheetView: .constant(false), selectionCat: $selectionC, selectioSort: $selectioS)
            }
        }
    static var previews: some View {
        // So the preview works
        BindingTestHolder()
    }
}

struct PickerDisplay: View {
    // Default selection
    @Binding var selection: String
    // Name of the Section displayed
    let nameSection: String
    // Elements to display inlined
    let categories: [String]
    var body: some View {
        Picker(nameSection, selection: $selection){
            ForEach(categories, id: \.self) {
                Text($0).tag($0)
            }
        }.pickerStyle(.inline)
    }
}
