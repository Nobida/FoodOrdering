//
//  CartView.swift
//  FoodOrder
//
//  Created by Joseph Wang on 2021/8/27.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartView: View {
    
    @ObservedObject var homeData: HomeViewModel
    @Environment(\.presentationMode) var present
    //@StateObject var cartData = CartViewModel()
    
    var body: some View {
        
        VStack {
            HStack(spacing: 20){
                Button(action: { present.wrappedValue.dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size:26, weight: .heavy))
                        .foregroundColor(.pink)
                }
                Text("My cart")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer()
                
            }
            

  
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVStack(spacing: 0) {
                    ForEach(homeData.cartItems) {cart in
                        // ItemView...
                        HStack(spacing: 15) {
                            WebImage(url: URL(string: cart.item.item_image))
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 130, height: 130)
                                .cornerRadius(15)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text(cart.item.item_name)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                
                                Text(cart.item.item_details)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                                
                                HStack(spacing: 15) {
                                    Text(homeData.getPrice(value: Float(cart.item.item_cost)))
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.black)
                                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                                    
                                    //Add - Sub Button...
                                    
                                    Button(action: {
                                        if cart.quantity > 1 {
                                            homeData.cartItems[homeData.getIndex(item: cart.item,isCardIndex: true)].quantity -= 1
                                            
                                        }
                                    }) {
                                        Image(systemName: "minus")
                                            .font(.system(size: 16, weight: .heavy))
                                            .foregroundColor(.black)
                                    }
                                    
                                    Text("\(cart.quantity)")
                                        .fontWeight(.heavy)
                                        .foregroundColor(.black)
                                        .padding(.vertical, 5)
                                        .padding(.horizontal, 10)
                                        .background(Color.black.opacity(0.06))
                                        
                                        
                                    Button(action: {
                                        homeData.cartItems[homeData.getIndex(item: cart.item,isCardIndex: true)].quantity += 1
                                    }) {
                                        Image(systemName: "plus")
                                            .font(.system(size: 16, weight: .heavy))
                                            .foregroundColor(.black)
                                    }
                                }
                                .padding()
                                .contextMenu {
                                    // for deleting order
                                    Button(action: {
                                        // deleting items from cart...
                                        let index = homeData.getIndex(item: cart.item, isCardIndex: true)
                                        homeData.cartItems.remove(at: index)
                                        let itemIndex = homeData.getIndex(item: cart.item, isCardIndex: false)
                                        homeData.items[itemIndex].isAdded = false
                                        homeData.filtered[itemIndex].isAdded = false
                                        homeData.cartItems.remove(at: index)
                                    }, label: {
                                        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                                    })
                                }
                            }
                        }
                        .padding()


                        
                    }
                }
            }
            
            //Bottom View...
            VStack {
                HStack {
                    Text("Total")
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                    
                    Spacer()
                    
                    Text(homeData.calculateTotalPrice())
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }.padding([.top,.horizontal])
            }
            .background(Color.white)
            Button(action: homeData.updateOrder) {
                Text(homeData.ordered ? "Cancel Order" : "Check out")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.pink)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .background(
                        Color("pink")
                    )
                    .cornerRadius(15)
            }
            .background(Color.white)

            
        }
        .background(Color.white)
    }
    
    

    

}


