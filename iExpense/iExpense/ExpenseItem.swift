//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Mohammed Mubashir on 02/04/23.
//

import Foundation

struct ExpenseItem:Identifiable, Codable {
    let id = UUID()
    var name : String
    var type : String
    var amount : Double
}
