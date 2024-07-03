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
        HStack {
            VStack{
                Text("Basic")
                    .font(.system(.title,design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Text("Rp.800")
                    .font(.system(size: 25,weight: .heavy,design: .rounded))
                    .foregroundColor(.white)
                Text("per bulan")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .frame(minWidth: 0,maxWidth: .infinity,minHeight:100)
            .padding(40)
            .background(Color.gray)
            .cornerRadius(10)
            
            VStack{
                Text("Pro")
                    .font(.system(.title,design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Text("Rp.1k")
                    .font(.system(size: 25,weight: .heavy,design: .rounded))
                    .foregroundColor(.white)
                Text("per bulan")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .frame(minWidth: 0,maxWidth: .infinity,minHeight:100)
            .padding(40)
            .background(Color.purple)
            .cornerRadius(10)
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
