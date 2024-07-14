//
//  ContentView.swift
//  swiftui_exercise
//
//  Created by Khoirul Fahmi on 30/06/24.
//

import SwiftUI

struct ContentView: View {

    var foods = [
        Food(name: "Bakso", image: "bakso"),
        Food(name: "Martabak", image: "martabak"),
        Food(name: "Nasi Campur", image: "nasi-campur"),
        Food(name: "Pangsit", image: "pangsit"),
        Food(name: "Ramen", image: "ramen"),
        Food(name: "Rendang", image: "rendang"),
        Food(name: "Sate", image: "sate"),
        Food(name: "Tumis Kangkung", image: "sayur"),

    
    ]
    
    var body: some View {
        List{
            ForEach(foods.indices,id:\.self){index in
                if(0...1).contains(index){
                    FullRowImage(food: self.foods[index])
                }else{
                    FoodRowImage(food: self.foods[index])
                }
            }
            .listRowSeparator(.hidden)
        }
    }
}

#Preview {
    ContentView()
}

struct Food : Identifiable {
    var id = UUID()
    var name : String
    var image : String
    
}

struct FoodRowImage: View {
    var food : Food
    var body: some View {
        HStack{
            Image(food.image)
                .resizable()
                .frame(width: 60,height: 60)
                .cornerRadius(12)
                .overlay(
                    Rectangle()
                        .foregroundStyle(.black)
                        .cornerRadius(12)
                        .opacity(0.2)
                )
            Text(food.name)
                .font(.system(.title,design: .rounded))
                .fontWeight(.regular)
                .foregroundStyle(.black)
        }
    }
}

struct FullRowImage :View {
    var food : Food
    var body: some View{
        ZStack{
            Image(food.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(12)
                .overlay(content: {
                    Rectangle()
                        .foregroundStyle(.black)
                        .cornerRadius(12)
                        .opacity(0.2)
                })
            Text(food.name)
                .font(.system(.title,design: .rounded))
                .fontWeight(.black)
                .foregroundStyle(.white)
            
        }
    }
}
