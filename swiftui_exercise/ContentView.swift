//
//  ContentView.swift
//  swiftui_exercise
//
//  Created by Khoirul Fahmi on 30/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isPlaying = false
    @State private var counter = 1

    
    var body: some View {
        VStack {
            Button{
                isPlaying.toggle()
            }label: {
                Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                    .font(.system(size: 150))
                    .foregroundStyle( isPlaying ? .red : .green)
        }
            .padding(.vertical)
            ExtractedView(counter: $counter,color: .red)
        }
    }
}

#Preview {
    ContentView()
}



struct ExtractedView: View {
    @Binding var counter: Int
    
    var color : Color
    
    var body: some View {
        Button{
           counter -= 1
        }label: {
          Circle()
                .frame(width: 150)
                .foregroundStyle(color)
                .overlay(content: {
                    Text("\(counter)")
                        .font(.system(size: 80,weight: .bold,design: .rounded))
                        .foregroundStyle(.white)
                })
            
        }
    }
}
