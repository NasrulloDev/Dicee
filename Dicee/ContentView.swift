//
//  ContentView.swift
//  Dicee
//
//  Created by Насрулло Исмоилжонов on 29/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var total = 0
    
    @State private var diceResult = 0
    
    var body: some View {
        VStack {
            Text("Total: \(total)")
            Text(String(diceResult))
            Button("Roll dice"){
                total = 0
                diceResult = Int.random(in: 1..<7)
                total += diceResult
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
