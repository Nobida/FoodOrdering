//
//  Menu.swift
//  FoodOrder
//
//  Created by Joseph Wang on 2021/8/26.
//

import SwiftUI

struct Menu: View {
    
    @ObservedObject var homeData : HomeViewModel
    
    var body: some View {
        VStack {
            
            Button(action: {}, label: {
                HStack(spacing: 15) {
                    Image(systemName : "cart")
                        .font(.title)
                        .foregroundColor(.pink)
                    Text("Cart")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.black)
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding()
            })
            
            Spacer()
            
            HStack {
                Spacer()
                Text("Version 0.1")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.pink)
            }
            .padding(10)
        }
        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(Color.white.ignoresSafeArea())
        
    }
}

