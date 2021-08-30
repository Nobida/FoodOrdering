//
//  CartViewModel.swift
//  FoodOrder
//
//  Created by Joseph Wang on 2021/8/27.
//

import SwiftUI


struct Ite : Identifiable {
    
    var id = UUID().uuidString
    var name : String
    var details: String
    var image: String
    var price: Float
    var quantity: Int
    var offset: CGFloat
    var isSwiped: Bool
    
}

class CartViewModel: ObservableObject {
    
    @Published var items = [
        
        Ite(name: "Peace Skull Shirt", details: "Gray - L", image: "p1", price: 20.99, quantity: 1, offset: 0, isSwiped: false),
        Ite(name: "Mytrle Beach Swetter", details: "White - M", image: "p2", price: 25.69, quantity: 2, offset: 0, isSwiped: false),
        Ite(name: "Eywa Hoodle", details: "White - L", image: "p3", price: 22.99, quantity: 1, offset: 0, isSwiped: false),
        Ite(name: "Russ Shirt", details: "Light Red - L", image: "p4", price: 15.2, quantity: 1, offset: 0, isSwiped: false),
        Ite(name: "Comfort Jacket", details: "Black - L", image: "p5", price: 29.02, quantity: 1, offset: 0, isSwiped: false)
    ]
}
