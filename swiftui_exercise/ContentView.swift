//
//  ContentView.swift
//  swiftui_exercise
//
//  Created by Khoirul Fahmi on 30/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Lorem Ipsum dol amet kwjdfjbjbfjsbjaifsvihisfvjbsridihfshuhfusjhjhjdfshjf")
            .fontWeight(.bold)
            .font(.system(size:20))
            .foregroundColor(.green)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            .padding()
            .rotation3DEffect(
                .degrees(60),axis: (x:1,y:0,z:0))
            .shadow(color: .blue, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,x: 0,y: 15)
            .truncationMode(.middle)
    }
}

#Preview {
    ContentView()
}
