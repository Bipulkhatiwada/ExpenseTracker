//
//  AddItemView.swift
//  ExpenseTracker
//
//  Created by Bipul Khatiwada on 29/08/2023.
//

import SwiftUI

struct AddItemView: View {
    
    
    @State private var name:String = ""
    @State private var type:String = "personal"
    @State private var amount:Double = 0.0
    
    @ObservedObject var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    @State private var types = ["personal","business"]
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section{
                        TextField("Expense Name", text: $name)
                        
                        Picker("Select Type", selection: $type){
                            ForEach(types, id: \.self){
                                Text($0)
                            }
                        }
                        
                        TextField("Enter Amount", value: $amount, format:.currency(code: "usd"))
                            .keyboardType(.decimalPad)
                        
                            .navigationTitle("add expenses")
                            .navigationBarTitleDisplayMode(.large)
                        
                    }
                        Button {
                            let expense = ExpenseItem(name: name, type: type, amount: amount)
                            expenses.items.append(expense)
                            dismiss()
                        } label: {
                            HStack(alignment: .center){
                                Spacer()
                                HStack{
                                    Text("Save")
                                    Image(systemName: "plus")
                                }.padding(10)
                                    .foregroundColor(.white)
                                    .background(.primary)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                Spacer()
                            }
                            
                        }
                        .listRowBackground(Color.clear)
                                
                }
                
            }
            
            }
        }
    }

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(expenses: Expenses())
    }
}
