//
//  ItemView.swift
//  FoodOrder
//
//  Created by Joseph Wang on 2021/8/27.
//

import SwiftUI
import SDWebImageSwiftUI

struct ItemView: View {
    
    var item: Item
    var body: some View {
        
        VStack {
            // Downloading Image From Web
            WebImage(url: URL(string: item.item_image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 100)
            
            HStack(spacing: 8) {
                Text(item.item_name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                ForEach(1...5, id:\.self){
                    index in
                    Image(systemName: "star.fill")
                        .foregroundColor(index <= Int(item.item_ratings) ?? 0 ? Color("pink") : .gray)
                }
            }
            
            HStack {
                Text(item.item_details)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
        }
    }
}
