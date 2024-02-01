//
//  CustomColor.swift
//  iExpense
//
//  Created by Lexter Tapawan on 01/02/2024.
//

import Foundation
import SwiftUI

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
