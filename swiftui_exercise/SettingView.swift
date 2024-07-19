//
//  SettingView.swift
//  swiftui_exercise
//
//  Created by Khoirul Fahmi on 19/07/24.
//

import SwiftUI

struct SettingView : View {
    
    private var displayOrders = [
    "Alphabetical", "Show Favorite First", "Show Check-in First"
    ]
    
    @State private var selectedOrder = 0
    @State private var showCheckInOnly = false
    @State private var maxPricelevel = 5

    
    
    var body : some View{
        NavigationStack{
            Form{
                Section(header: Text("Sort Preference"),content: {
                    Picker(selection : $selectedOrder,label : Text("Display Order")){
                        ForEach(0 ..< displayOrders.count, id : \.self){
                            Text(self.displayOrders[$0])
                        }
                    }
                })
                Section(header: Text("Filter Preference"),content: {
                    Toggle(isOn: $showCheckInOnly){
                        Text("Show Book-in Only")
                    }
                })
                
                Stepper(onIncrement: {
                    self.maxPricelevel += 1
                    if self.maxPricelevel > 5 {
                        self.maxPricelevel = 5
                    }
                }, onDecrement: {
                    self.maxPricelevel -= 1
                    if self.maxPricelevel < 1 {
                        self.maxPricelevel = 1
                    }
                }){
                    Text("Show \(String(repeating: "$", count: maxPricelevel)) or bellow")
                }
            }
        }
    }
}

#Preview {
    SettingView()
}
