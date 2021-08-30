//
//  ContentView.swift
//  FoodOrder
//
//  Created by Joseph Wang on 2021/8/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            Home()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
