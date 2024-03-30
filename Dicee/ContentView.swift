//
//  ContentView.swift
//  Dicee
//
//  Created by Насрулло Исмоилжонов on 29/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var amountOfDice = 2
    
    @State private var total = 0
    
    @State private var diceResults: [Int] = [1,1]
    
    var body: some View {
        VStack {
            Text("Total: \(total)")
            
            ForEach(diceResults, id: \.self){ dice in
                Text(String(dice))
            }
            
            Button("Roll dice"){
                diceResults = []
                total = 0
                for _ in 0..<amountOfDice {
                    let diceResult = Int.random(in: 1..<7)
                    diceResults.append(diceResult)
                    total += diceResult
                }
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
