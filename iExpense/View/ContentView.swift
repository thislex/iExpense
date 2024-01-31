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
    
    // MARK: - BODY
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.item, id: \.name) { item in
                    Text(item.name)
                }
            }
            .navigationTitle("iExpense")
        }
    }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
}
