//
//  ContentView.swift
//  swiftui_exercise
//
//  Created by Khoirul Fahmi on 30/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
        }
        HStack(spacing:15) {
            CardPlan(title: "Basic", price: "200", textColor: .white, bgColor: .blue)
            ZStack {
                CardPlan(title: "Pro", price: "400", textColor: .white, bgColor: .purple)
                
                Text("Best for Beginner")
                    .font(.system(.caption,design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(.black)
                    .offset(x:0,y: 87)
            }
        }
        .padding(15)
        VStack(spacing:15){
            ZStack {
                CardPlan(title: "Team", price: "1200", textColor: .white, bgColor: .green)
                Text("Best for Team with 20 member")
                    .font(.system(.caption,design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(.black)
                    .offset(x:0,y: 87)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment:.leading,spacing: 2) {
            Text("Pilih")
                .font(.system(.largeTitle,design: .rounded))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Text("Paketmu")
                .font(.system(.largeTitle,design: .rounded))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
    }
}

struct CardPlan: View {
    var title : String
    var price : String
    var textColor : Color
    var bgColor : Color
    
    var body: some View {
        VStack{
            Text(title)
                .font(.system(.title,design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
            Text(price)
                .font(.system(size: 25,weight: .heavy,design: .rounded))
                .foregroundColor(textColor)
            Text("per bulan")
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(minWidth: 0,maxWidth: .infinity,minHeight:100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
