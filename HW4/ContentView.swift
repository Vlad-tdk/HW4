//
//  ContentView.swift
//  HW4
//
//  Created by Vlad on 16.12.23..
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = Double.random(in: 0...100)
    @State private var targetValue = Int.random(in: 0...100)
    @State private var showAlert = false
        
    var body: some View {
        VStack {
            SliderViewSwiftUI(
                currentValue: $currentValue,
                targetValue: targetValue,
                color: .green,
                alpha: scoreNow()
            )
            
            Button("Проверь меня!") {
                showAlert.toggle()
            }
            .padding()
            .alert("Your Score", isPresented: $showAlert, actions: {}) {
                Text(scoreNow().formatted())
            }
            
            Button("Начать сначала") {
                targetValue = Int.random(in: 0...100)
                currentValue = Double.random(in: 0...100)
            }
        }
    }
    
    private func scoreNow() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

