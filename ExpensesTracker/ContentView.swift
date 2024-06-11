//
//  ContentView.swift
//  ExpensesTracker
//
//  Created by Buhle Radzilani on 2024/06/11.
//

import SwiftUI

struct ContentView: View {
    //@stateObjects keeps an eye on those published variables of a class, any change that happens will reflected on the view.
    //Remember a normal state does not work on a class you need a stateObject
    @StateObject var expenses = Expenses()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items, id: \.name) {item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button{
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                }label: {
                   Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet){
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
