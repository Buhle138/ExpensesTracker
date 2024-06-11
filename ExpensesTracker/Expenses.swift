//
//  Expenses.swift
//  ExpensesTracker
//
//  Created by Buhle Radzilani on 2024/06/11.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
