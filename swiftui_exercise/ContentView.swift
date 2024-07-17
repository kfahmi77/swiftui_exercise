//
//  ContentView.swift
//  swiftui_exercise
//
//  Created by Khoirul Fahmi on 30/06/24.
//

import SwiftUI

struct ContentView: View {
    
    init(){
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.green, .font : UIFont(name: "ArialRoundedMTBold", size: 30) ?? 30]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.green, .font : UIFont(name: "ArialRoundedMTBold", size: 30) ?? 30]
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        
        
    }

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
        NavigationStack{
            List(content: {
                ForEach(foods, content: { food in
                    NavigationLink(destination: FoodDetailView(food: food))
                    {
                        FoodRowImage(food: food)
                    }
                   
                })
            })
            .listStyle(.plain)
            .navigationTitle("Menu Makanan")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .accentColor(.black)
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

struct FoodDetailView : View {
    var food : Food
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View{
        VStack{
            Image(food.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(food.name)
                .font(.system(.title,design: .rounded))
                .fontWeight(.black)
            
            Spacer()
        }
        
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .topBarLeading, content: {
                Button{
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("\(Image(systemName: "chevron.left")) \(food.name)")
                        .foregroundStyle(.black)
                }
            })
        }
        
    }
}
