//
//  ExpenseItem.swift
//  ExpenseTracker
//
//  Created by Bipul Khatiwada on 29/08/2023.
//

import Foundation
import SwiftUI

struct ExpenseItem: Identifiable,Codable{
    var id:UUID = UUID()
    let name:String
    let type:String
    let amount:Double
    
}
