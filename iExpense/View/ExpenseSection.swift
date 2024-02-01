//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Lexter Tapawan on 01/02/2024.
//

import SwiftUI

struct ExpenseSectionView: View {
    
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    var body: some View {
        Section(title) {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                            .font(.subheadline)
                    }
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundStyle(customColor(item.amount))
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}
