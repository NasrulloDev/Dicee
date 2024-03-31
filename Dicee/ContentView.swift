//
//  ContentView.swift
//  Dicee
//
//  Created by Насрулло Исмоилжонов on 29/03/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var amountOfDice = 2
    
    @State private var total = 0
    @State private var previous = 0
    
    @State private var diceResults: [Int] = [1,1]
    
    @State private var showEdit = false
    
    var body: some View {
        VStack {
            Text("Previous total: \(previous)")
            
            Text("Total: \(total)")
            
            ForEach(diceResults, id: \.self){ dice in
                Text(String(dice))
            }
            
            Button("Roll dice"){
                previous = total
                rollDice()
            }
            
            Button("Settings"){
                showEdit = true
            }
        }
        .sheet(isPresented: $showEdit) {
            Form{
                Section("How many dices do you want to roll?"){
                    TextField("Amount...", value: $amountOfDice, format: .number)
                }
            }
            Button("Apply"){
                showEdit = false
                restart()
            }

        }
        .padding()
    }
    
    func rollDice() {
        diceResults = []
        total = 0
        for _ in 0..<amountOfDice {
            let diceResult = Int.random(in: 1..<7)
            diceResults.append(diceResult)
            total += diceResult
        }
    }
    
    func restart() {
        rollDice()
        total = diceResults.count
        let newArray = diceResults.map{$0 * 0 + 1}
        diceResults = newArray
    }
}

#Preview {
    ContentView()
}
