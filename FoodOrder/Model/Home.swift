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
            HStack(spacing: 15) {
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
            .padding([.horizontal,.top])
            Divider()
            HStack(spacing: 15){
                TextField("Search", text: $HomeModel.search)
                if HomeModel.search != "" {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.gray)
                    })
                    .animation(.easeIn)
                }
            }.padding(.horizontal)
            .padding(.top,10)
            
            Divider()
            Spacer()
        }
        .onAppear(perform: {
            // calling location delegate
            HomeModel.locationManager.delegate = HomeModel 
            HomeModel.locationManager.requestWhenInUseAuthorization()
            // Modifying Info.plist
        })
    }
}



