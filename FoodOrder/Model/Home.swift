//
//  Home.swift
//  FoodOrder
//
//  Created by Joseph Wang on 2021/8/26.
//


import SwiftUI

struct Home: View {
    
    @StateObject var HomeModel = HomeViewModel()
    
    var body: some View {
        
        VStack(spacing: 10) {
            HStack(spacing: 15){
                Button(action: {}, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.title)
                        .foregroundColor(.pink)
                })
                
                Text("Deliver To")
                    .foregroundColor(.black)
                
                Text("Apple")
                    .font(.caption)
                    .fontWeight(.heavy)
                    .foregroundColor(.pink)
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
            Divider()
            Spacer()
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
