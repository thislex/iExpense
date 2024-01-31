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
    
    func removeItems(at offsets: IndexSet) {
        expenses.item.remove(atOffsets: offsets)
    }
    
    // MARK: - BODY
    
    var body: some View {
        NavigationStack {
            List {
                //Since we used the Identifiable protocol for our ExpenseItem, we no longer need specify for ForEach which id is unique. Therefore we can rewrite it
                //ForEach(expenses.item, id: \.id) { item in
                //    Text(item.name)
                //}
                ForEach(expenses.item) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
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
