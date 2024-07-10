//
//  ContentView.swift
//  swiftui_exercise
//
//  Created by Khoirul Fahmi on 30/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.0

    
    var body: some View {
        HStack {
            ZStack{
                    Circle()
                    .frame(width: 200)
                    .foregroundStyle(circleColorChanged ? Color(.systemGray5) : .red)
                   
                
                Image(systemName: "heart.fill")
                    .foregroundStyle(heartColorChanged ? .red : .white)
                    .font(.system(size: 100))
                    .scaleEffect(heartSizeChanged ? 1 : 0.5)
                  
            }
            .onTapGesture {
                withAnimation(.linear(duration: 0.5)){
                    self.circleColorChanged.toggle()
                    self.heartColorChanged.toggle()
                    self.heartSizeChanged.toggle()
                }
            }
            
        .padding(.vertical)
        }
        
        ZStack {
            Circle()
                .stroke(.gray, lineWidth: 14)
                .frame(width: 100)
            
            Circle()
                .trim(from: 0,to: 0.2)
                .stroke(Color(.systemGray5),lineWidth: 7)
                .frame(width: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear(duration: 1).repeatForever(autoreverses: false),value: isLoading)
                .onAppear(){
                    self.isLoading = true
            }

        }
        
        .padding(.vertical)
        .padding(.vertical)
        ZStack{
            Text("Loading")
                .font(.system(.body,design: .rounded))
                .bold()
                .offset(x:0,y: -25)
            
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(.systemGray5),lineWidth: 5)
                .frame(width: 250,height: 3)
            
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(.green),lineWidth: 5)
                .frame(width: 30,height: 3)
                .offset(x:isLoading ? 100  : -110,y: 0)
                .animation(.linear(duration: 1).repeatForever(autoreverses: true),value: isLoading)
            
        }
        .onAppear(){
            self.isLoading = true
        }
        
    }
}

#Preview {
    ContentView()
}
