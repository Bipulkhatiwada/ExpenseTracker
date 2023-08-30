//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Bipul Khatiwada on 28/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    
    @State private var addExpenseViewShown = false

     
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.id) { item in
                    HStack{
                        VStack(alignment: .leading, spacing: 10) {
                            Text(item.name)
                            Text(item.type)
                        }.padding(10)
                        Spacer()
                        Text(item.amount, format: .currency(code: "usd"))
                    }
                    
                }
                .onDelete(perform: removeRows) // Enable swipe-to-delete
            }
            .navigationTitle("Expenses")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
//                        let expense = ExpenseItem(name: "New Item", type: "Expense", amount: 0.0)
//                        expenses.items.append(expense)
                        addExpenseViewShown = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            .sheet(isPresented: $addExpenseViewShown){
                AddItemView(expenses: expenses)
            }
            
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


