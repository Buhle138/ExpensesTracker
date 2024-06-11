//
//  ExpenseItem.swift
//  ExpensesTracker
//
//  Created by Buhle Radzilani on 2024/06/11.
//

import Foundation

//Identifiable allows us to do away if defining an id in the foreach loop. 
struct ExpenseItem: Identifiable{
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
