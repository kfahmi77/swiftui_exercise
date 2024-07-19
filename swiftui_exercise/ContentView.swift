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

   @State var foods = [
        Food(name: "Bakso", image: "bakso",price: "10000",englishName: "Meatball",priceLevel: 1,isFavorite: true),
        Food(name: "Martabak", image: "martabak",price: "20000",englishName: "Meat Pancake",priceLevel: 2),
        Food(name: "Nasi Campur", image: "nasi-campur",price: "25000",englishName: "Mixed Rice",priceLevel: 3),
        Food(name: "Pangsit", image: "pangsit",price: "5000",englishName: "Dumpling",priceLevel: 0),
        Food(name: "Ramen", image: "ramen",price: "45000",englishName: "Ramen",priceLevel: 4),
        Food(name: "Rendang", image: "rendang",price: "35000",englishName: "Beef Meat with Coconut Milk",priceLevel: 3),
        Food(name: "Sate", image: "sate",price: "40000",englishName: "Satay",priceLevel: 3),
        Food(name: "Tumis Kangkung", image: "sayur",price: "20000",englishName: "Saute Water Spinach",priceLevel: 2),
        Food(name: "Bakso", image: "bakso",price: "10000",englishName: "Meatball",priceLevel: 1,isFavorite: true),
        Food(name: "Martabak", image: "martabak",price: "20000",englishName: "Meat Pancake",priceLevel: 2),
        Food(name: "Nasi Campur", image: "nasi-campur",price: "25000",englishName: "Mixed Rice",priceLevel: 3),
        Food(name: "Pangsit", image: "pangsit",price: "5000",englishName: "Dumpling",priceLevel: 0),
        Food(name: "Ramen", image: "ramen",price: "45000",englishName: "Ramen",priceLevel: 4),
        Food(name: "Rendang", image: "rendang",price: "35000",englishName: "Beef Meat with Coconut Milk",priceLevel: 3),
        Food(name: "Sate", image: "sate",price: "40000",englishName: "Satay",priceLevel: 3),
        Food(name: "Tumis Kangkung", image: "sayur",price: "20000",englishName: "Saute Water Spinach",priceLevel: 2),
    ]
    
    @State private var selectedFood : Food?
    @State private var showSettings : Bool = false
    
    var body: some View {
        NavigationStack{
            List{
                if foods.isEmpty{
                    Text("Food is Empty")
                    
                }else{
                    ForEach(foods){ food in
                      FoodRowImage(food: food)
                            .contextMenu{
                                Button( action:{
                                    self.checkIn(item: food)
                                }){
                                    HStack{
                                        Text("Book-in")
                                            .foregroundStyle(.green)
                                        Image(systemName: "checkmark.seal.fill")
                                    }
                                }
                                
                                Button( action:{
                                    self.delete(item: food)
                                }){
                                    HStack{
                                        Text("Delete")
                                        Image(systemName: "trash.fill")
                                            .foregroundStyle(.red)
                                    }
                                }
                                
                                Button( action:{
                                    self.setFavorite(item: food)
                                }){
                                    HStack{
                                        Text("Favorite")
                                        Image(systemName: "star.fill")
                                    }
                                }
                                .onTapGesture{
                                    self.selectedFood = food
                                }
                                
                            }
                    }
                    .onDelete(perform: { indexSet in
                        self.foods.remove(atOffsets: indexSet)
                    })
                }

            }
        
            .listStyle(.plain)
            .navigationTitle("Food Menu")
            .navigationTitle("Settings")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        self.showSettings = true
                    },
                           label: {
                        Image(systemName: "gear")
                            .font(.title2)
                            .foregroundStyle(.black)
                    })
                })
            }
            .sheet(isPresented: $showSettings, content: {
                SettingView()
            })
            .navigationBarTitleDisplayMode(.automatic)
        }
        .accentColor(.black)
        }
    
    private func delete(item food : Food){
        if let index = self.foods.firstIndex(where: {$0.id == food.id}){
            self.foods.remove(at: index)
        }
    }
    
    private func setFavorite(item food : Food){
        if let index = self.foods.firstIndex(where: {$0.id == food.id}){
            self.foods[index].isFavorite.toggle()
        }
    }
    
    private  func checkIn(item food : Food){
        if let index = self.foods.firstIndex(where: {$0.id == food.id}){
            self.foods[index].isBooked.toggle()
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
    var price : String
    var englishName : String
    var priceLevel : Int
    var isFavorite : Bool = false
    var isBooked : Bool = false
    
}

struct FoodRowImage: View {
    var food : Food
    var body: some View {
        HStack{
            Image(food.image)
                .resizable()
                .frame(width: 60,height: 60)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .padding(.trailing,10)
               
            VStack(alignment: .leading, content: {
                HStack(content: {
                    Text(food.name)
                        .font(.system(.body,design: .rounded))
                        .bold()
                    
                    Text(String(repeating: "$", count: food.priceLevel))
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                })
                Text(food.englishName)
                    .font(.system(.subheadline,design: .rounded))
                    .bold()
                    .foregroundStyle(.secondary)
                
                Text("Rp \(food.price)")
                    .font(.system(.subheadline,design: .rounded))
                    .foregroundStyle(.secondary)
            })
            
            Spacer()
                .layoutPriority(-100)
            
            if food.isBooked {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(.red)
            }
            
            if food.isFavorite{
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
            
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
