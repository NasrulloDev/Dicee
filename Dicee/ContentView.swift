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
    @State private var typeOfDice = 6
    let diceTypes = [4, 6, 8, 10, 12, 20, 100]
    
    @State private var total = 0
    @State private var previous = 0
    
    @State private var diceResults: [Int] = [1,1]
    
    @State private var showEdit = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Previous total: \(previous)")
                
                Text("Total: \(total)")
                
                HStack{
                    ForEach(diceResults, id: \.self){ dice in
                        Text(String(dice))
                    }
                }
                
                Button("Roll dice"){
                    previous = total
                    rollDice()
                }
                
            }
            .toolbar {
                ToolbarItem {
                    Button("Settings"){
                        showEdit = true
                    }
                }
            }
            .sheet(isPresented: $showEdit) {
                Form{
                    Section("How many dices do you want to roll?"){
                        TextField("Amount...", value: $amountOfDice, format: .number)
                    }
                    
                    Section("How many sided dice do you want to roll?"){
                        Picker("Sides..", selection: $typeOfDice){
                            ForEach(diceTypes, id: \.self){
                                Text(String($0))
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }
                Button("Apply"){
                    previous = total
                    showEdit = false
                    restart()
                }
                
            }
        }
        .padding()
    }
    
    func rollDice() {
        diceResults = []
        total = 0
        for _ in 0..<amountOfDice {
            let diceResult = Int.random(in: 1..<(typeOfDice + 1))
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
