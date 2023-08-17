//
//  MenuCategoryButton.swift
//  LIttleLemonDinnerMenu
//
//  Created by Adrien CHABAUD on 2023-08-17.
//

import Foundation
import SwiftUI

// Each button of the category menu is made from this
struct MenuCategoryButton: View {
    var icon: String
    var name: String
    @Binding var selectedCategory: Bool
    @Binding var mainCat: Bool
    @Binding var drinkCat: Bool
    @Binding var DessertCat: Bool
    
    
    var body: some View {
        Button {
            self.mainCat = false
            self.drinkCat = false
            self.DessertCat = false
            self.selectedCategory = true
        } label: {
            VStack {
                Image(systemName: icon)
                    .font(.system(size: 35))
                Text(name)
                    .font(.system(size: 10))
                    .fontWeight(.bold)
                
            }
            .foregroundColor(selectedCategory ? Color("Yellow") : Color("Green"))
        }
    }
}
