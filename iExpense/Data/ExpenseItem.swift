//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Lexter Tapawan on 31/01/2024.
//

import Foundation

// Simple struct for the expense items
// Adding Identifiable to this struct just means that this type can now be identified uniquely. It has one requirement, which is that there must be a property called id that contains a unique identifier. In this case, we have id = UUID()
// Now that we added this Identifiable protocol, we no longer need to tell ForEach which property to use for the identifier. It now knows there will be an id property.
struct ExpenseItem: Identifiable {
    let id = UUID()
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
