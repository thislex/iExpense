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

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

// We used the Observable macro here so that SwiftUI can watch over any changes.
// Created this class to store an array of the expense items.

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
