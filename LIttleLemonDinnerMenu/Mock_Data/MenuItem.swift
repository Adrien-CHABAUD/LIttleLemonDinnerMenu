//
//  Food.swift
//  LIttleLemonDinnerMenu
//
//  Created by Adrien CHABAUD on 2023-07-02.
//

import Foundation

struct MenuItem: Identifiable, MenuItemDetail {
    var id = UUID()
    let title: String
    let picture: String
    var price: Double
    var ingredients: [Ingredients]
    var menyCategory: MenuCategory
    var orderCount: Int
    


}

protocol MenuItemDetail {
    var price: Double { get }
    var title: String { get }
    var menyCategory: MenuCategory { get }
    var orderCount: Int { get set }
    var ingredients: [Ingredients] { get set}
}

extension MenuItem {
    static let examples: [MenuItem] = [
        .init(title: "Food 1", picture: "food1", price: 10.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Food, orderCount: 0),
        .init(title: "Food 2", picture: "food2", price: 9.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Food, orderCount: 0),
        .init(title: "Food 3", picture: "food3", price: 15.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Food, orderCount: 0),
        .init(title: "Food 4", picture: "food4", price: 12.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Food, orderCount: 0),
        .init(title: "Food 5", picture: "food5", price: 16.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Food, orderCount: 0),
        .init(title: "Food 6", picture: "food6", price: 21.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Food, orderCount: 0),
        .init(title: "Food 7", picture: "food7", price: 19.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Food, orderCount: 0),
        .init(title: "Food 8", picture: "food8", price: 11.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Food, orderCount: 0),
        .init(title: "Food 9", picture: "food9", price: 10.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Food, orderCount: 0),
        .init(title: "Food 10", picture: "food10", price: 4.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Food, orderCount: 0),
        .init(title: "Food 11", picture: "food11", price: 5.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Food, orderCount: 0),
        .init(title: "Food 12", picture: "food12", price: 10.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Food, orderCount: 0),
        .init(title: "Drink 1", picture: "drink1", price: 10.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Drink, orderCount: 0),
        .init(title: "Drink 2", picture: "drink2", price: 9.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Drink, orderCount: 0),
        .init(title: "Drink 3", picture: "drink3", price: 15.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Drink, orderCount: 0),
        .init(title: "Drink 4", picture: "drink4", price: 12.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Drink, orderCount: 0),
        .init(title: "Drink 5", picture: "drink5", price: 16.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Drink, orderCount: 0),
        .init(title: "Dessert 1", picture: "dessert1", price: 10.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Dessert, orderCount: 0),
        .init(title: "Dessert 2", picture: "dessert2", price: 9.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Dessert, orderCount: 0),
        .init(title: "Dessert 3", picture: "dessert3", price: 15.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Dessert, orderCount: 0),
        .init(title: "Dessert 4", picture: "dessert4", price: 12.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Dessert, orderCount: 0),
        .init(title: "Dessert 5", picture: "dessert5", price: 16.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Dessert, orderCount: 0),
        .init(title: "Dessert 6", picture: "dessert6", price: 21.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Dessert, orderCount: 0),
        .init(title: "Dessert 7", picture: "dessert7", price: 19.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Dessert, orderCount: 0),
        .init(title: "Dessert 8", picture: "dessert8", price: 11.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Dessert, orderCount: 0),
        .init(title: "Dessert 9", picture: "dessert9", price: 10.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Dessert, orderCount: 0),
        .init(title: "Dessert 10", picture: "dessert10", price: 4.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Dessert, orderCount: 0),
        .init(title: "Dessert 11", picture: "dessert11", price: 5.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Dessert, orderCount: 0),
        .init(title: "Dessert 12", picture: "dessert12", price: 10.99, ingredients: [.Broccoli, .Carrot], menyCategory: .Dessert, orderCount: 0)
    ]
}
