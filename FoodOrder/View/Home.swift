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
        
        ZStack {
            VStack(spacing: 10) {
                HStack(spacing: 15) {
                    Button(action: {
                        withAnimation(.easeIn){
                            HomeModel.showMenu.toggle()
                        }
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(.pink)
                    })
                    
                    Text(HomeModel.userLocation == nil ? "Locating..." : "Deliver To")
                        .foregroundColor(.black)
                    
                    Text(HomeModel.userAddress)
                        .font(.caption)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .padding([.horizontal,.top])
                Divider()
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    TextField("Search", text: $HomeModel.search)

                }.padding(.horizontal)
                .padding(.top,10)
                
                Divider()
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    VStack(spacing: 25) {
                        ForEach(HomeModel.filtered){item in
                            
                            // Item View
                            //Text(item.item_name)
                            
                            ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                                ItemView(item: item)
                                
                                HStack {
                                    Text("FREE DELIVERY")
                                        .foregroundColor(.white)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal)
                                        .background(Color.pink)
                                    
                                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                                    
                                    Button(action: {}, label: {
                                        Image(systemName: "plus")
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(Color.pink)
                                            .clipShape(Circle())
                                    })
                                }
                                .padding(.trailing, 10)
                                .padding(.top, 10)
                                
                            })
                            .frame(width: UIScreen.main.bounds.width - 30)
                        }
                    }
                    .padding(.top, 10)
                })
                Spacer()
            }
            
            
            
            //Side Menu...
            HStack {
                Menu(homeData: HomeModel)
                    .offset(x: HomeModel.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)

            }
            .background(Color.black.opacity(HomeModel.showMenu ? 0.3 : 0).ignoresSafeArea()                                    .onTapGesture (
                            perform: {
                                withAnimation(.easeIn){
                                    HomeModel.showMenu.toggle()}
                            }))
            
            if HomeModel.noLocation {
                Text("Please Enable Location Access In Setting To Further Move On !!!")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 120)
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3).ignoresSafeArea()


                    )

            }
            
        }
        
        
        .onAppear(perform: {
            // calling location delegate
            HomeModel.locationManager.delegate = HomeModel
            // Modifying Info.plist
        })
        .onChange(of: HomeModel.search, perform: {value in
            
            // to avoid Continus Search requests
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                if value == HomeModel.search && HomeModel.search != "" {
                    // Search Data
                    HomeModel.filterData()
                }
            }
            
            if HomeModel.search == "" {
                withAnimation(.linear){
                    HomeModel.filtered = HomeModel.items
                }
            }
        })
    }
}



