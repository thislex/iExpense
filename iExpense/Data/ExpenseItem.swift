//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Lexter Tapawan on 31/01/2024.
//

import Foundation

// Simple struct for the expense items
struct ExpenseItem {
    let name: String
    let type: String
    let amount: Double
}

// We used the Observable macro here so that SwiftUI can watch over any changes.
// Created this class to store an array of the expense items.
@Observable
class Expenses {
    var item = [ExpenseItem]()
}
