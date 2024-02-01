//
//  ContentView.swift
//  iExpense
//
//  Created by Lexter Tapawan on 30/01/2024.
//

import Observation
import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    // MARK: - METHODS
    
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
    
    // MARK: - BODY
    
    var body: some View {
        NavigationStack {
            List {
                ExpenseSectionView(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
                ExpenseSectionView(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
}
