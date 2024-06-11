//
//  Expenses.swift
//  ExpensesTracker
//
//  Created by Buhle Radzilani on 2024/06/11.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        //Persisting the data to local storage. encoding them into a JSON format.
        didSet{
            
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    //Persisting the data from the local storage. encoding them back to their original format.
    init(){
        if let savedItems = UserDefaults.standard.data(forKey: "Items"){
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        items = []
    }
}
