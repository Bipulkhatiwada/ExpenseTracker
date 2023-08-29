//
//  Expenses.swift
//  ExpenseTracker
//
//  Created by Bipul Khatiwada on 29/08/2023.
//

import Foundation
import SwiftUI

class Expenses: ObservableObject{
    @Published var items = [ExpenseItem]()
}
