//
//  MenuViewModel.swift
//  LIttleLemonDinnerMenu
//
//  Created by Adrien CHABAUD on 2023-07-19.
//

import SwiftUI

final class MenuViewModel: ObservableObject {
    @Published var foodMenuItems: [MenuItem] = []
    @Published var drinkMenuItems: [MenuItem] = []
    @Published var dessertMenuItems: [MenuItem] = []
    init(){
        foodMenuItems = makeFoodMenuItems()
        drinkMenuItems = makeDrinkMenuItems()
        dessertMenuItems = makeDessertMenuItems()
    }
    //MARK: - Helpers
    private func makeFoodMenuItems() -> [MenuItem] {
        (1...12)
            .map {
                MenuItem(ordersCount: $0 * 200, title: "Food \($0)", menuCategory: .Food, picture: "food\($0)", price: Double($0) + 5, ingredients: Ingredient.allCases, orderCount: $0 + 20
                )
            }
    }
    
    private func makeDrinkMenuItems() -> [MenuItem] {
        (1...5)
            .map {
                MenuItem(ordersCount: $0 * 200, title: "Drink \($0)", menuCategory: .Food, picture: "drink\($0)", price: Double($0) + 0, ingredients: Ingredient.allCases, orderCount: $0 + 20
                )
            }
    }
    
    private func makeDessertMenuItems() -> [MenuItem] {
        (1...12)
            .map {
                MenuItem(ordersCount: $0 * 200, title: "Dessert \($0)", menuCategory: .Food, picture: "dessert\($0)", price: Double($0) + 2, ingredients: Ingredient.allCases, orderCount: $0 + 20
                )
            }
    }
    
}
