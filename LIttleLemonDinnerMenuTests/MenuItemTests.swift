//
//  MenuItemTests.swift
//  LIttleLemonDinnerMenuTests
//
//  Created by Adrien CHABAUD on 2023-07-04.
//

import XCTest
@testable import LIttleLemonDinnerMenu

final class MenuItemTests: XCTestCase {
    
    func test_MenuItemTitle_init_menuTitleEqualInitializedTitle() {
        // Create new menuItem
        let menuItem = MenuItem(title: "coffee", picture: "drink1", price: 10.99, ingredients: [.Broccoli], menyCategory: .Drink, orderCount: 30)
        // Unit testing on the title
        XCTAssert(menuItem.title == "coffee")
    }
    
    func test_MenuItemIngredients_init_menuItemIngredientsEqualInitializedIngredients(){
        let menuItem = MenuItem(title: "coffee", picture: "drink1", price: 10.99, ingredients: [.Broccoli], menyCategory: .Drink, orderCount: 30)
        // Unit testing
        XCTAssert(menuItem.ingredients[0] == Ingredients.Broccoli)
    }
    
    func test_MenuItemPrice_init_menuItemPriceEqualInitializedPrice(){
        let menuItem = MenuItem(title: "coffee", picture: "drink1", price: 10.99, ingredients: [.Broccoli], menyCategory: .Drink, orderCount: 30)
        // Unit testing
        print(menuItem.price)
        XCTAssert(menuItem.price == 10.99)
    }
}
