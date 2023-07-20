//
//  Food.swift
//  LIttleLemonDinnerMenu
//
//  Created by Adrien CHABAUD on 2023-07-02.
//

import Foundation

protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var menuCategory: MenuCategory { get }
    var ordersCount: Int { set get }
    var title: String { get }
    var ingredients: [Ingredient] { get set }
    var picture: String { get }
}

struct MenuItem: Identifiable, MenuItemProtocol {
    var ordersCount: Int
    var id = UUID()
    let title: String
    var menuCategory: MenuCategory
    let picture: String
    var price: Double
    var ingredients: [Ingredient]
    var orderCount: Int
    var displayPrice: String {
        String(
            round(price / 0.01) * 0.01
            )
    }
}
