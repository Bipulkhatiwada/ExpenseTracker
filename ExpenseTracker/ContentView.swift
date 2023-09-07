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
            content
                .navigationTitle("Expenses")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        addButton
                    }
                }
                .sheet(isPresented: $addExpenseViewShown) {
                    AddItemView(expenses: expenses)
                }
        }
    }

    var content: some View {
        Form {
            List {
                ForEach(expenses.items) { item in
                    Section(header: Text(item.type.capitalized + " Expenses")) {
                        ExpenseRow(item: item)
                    }
                }
                .onDelete(perform: removeRows)
            }
        }
    }
    struct ExpenseRow: View {
        var item: ExpenseItem

        var body: some View {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.name)
                    Text(item.type)
                }
                .padding(10)
                Spacer()
                Text(item.amount, format: .currency(code: "usd"))
            }
        }
    }

    var addButton: some View {
        Button {
            addExpenseViewShown = true
        } label: {
            Image(systemName: "plus")
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


