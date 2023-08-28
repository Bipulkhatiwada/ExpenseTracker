//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Bipul Khatiwada on 28/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numbers = UserDefaults.standard.array(forKey: "counterValues") as? [Int] ?? []
//    @AppStorage("tapCounter") private var numbers = [Int]()
    @State private var newNumber = 1
     
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button("Tap Counter") {
                        self.numbers.append(newNumber)
                        UserDefaults.standard.set(numbers, forKey: "counterValues")
                        newNumber += 1
                    }
                }
                Section {
                    ForEach(numbers, id: \.self) { number in
                        Text("\(number)") // Use 'number' directly here
                    }.onDelete(perform: removeRows)
                }
                
            }
            .toolbar {
                EditButton()
            }
            .navigationBarTitle("Number List")
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        self.numbers.remove(atOffsets: offsets)
        UserDefaults.standard.set(numbers, forKey: "counterValues")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


