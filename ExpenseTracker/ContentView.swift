//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Bipul Khatiwada on 28/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numbers = [Int]()
     
    var body: some View {
        NavigationView {
                List {
                    ForEach(numbers, id: \.self) { number in
                        Text("\(number)") // Use 'number' directly here
                    }.onDelete(perform: removeRows)
                    Button("Add"){
                        self.numbers.append(1)
                    }
                }
                .toolbar{
                    EditButton()
                }

            .navigationBarTitle("Number List")
        }
    }
    
    func removeRows(at offsets: IndexSet){
        self.numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

