//
//  Item.swift
//  FoodOrder
//
//  Created by Joseph Wang on 2021/8/27.
//

import SwiftUI

struct Item: Identifiable {
    
    var id: String
    var item_name: String
    var item_cost: NSNumber
    var item_details: String
    var item_image: String
    var item_ratings: String
}
