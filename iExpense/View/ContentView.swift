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
        expenses.items.remove(atOffsets: offsets)
    }
    
    func customColor(_ amount: Double) -> Color {
        switch amount {
        case ..<10: 
            return .yellow
        case 10..<100:
            return .green
        default:
            return .red
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        NavigationStack {
            List {
                //Since we used the Identifiable protocol for our ExpenseItem, we no longer need specify for ForEach which id is unique. Therefore we can rewrite it
                //ForEach(expenses.item, id: \.id) { item in
                //    Text(item.name)
                //}
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                                .font(.footnote)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundStyle(customColor(item.amount))
                    }
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
