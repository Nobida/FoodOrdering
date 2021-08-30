//
//  Cart.swift
//  FoodOrder
//
//  Created by Joseph Wang on 2021/8/27.
//

import SwiftUI

struct Cart: Identifiable {
    
    var id = UUID().uuidString
    var item: Item
    var quantity: Int
}
