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
    //In content view we are creating the object so we use the @Stateobject
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items) {item in
                    
                    HStack{
                        
                        //leading will make the views to be aligned at the start of the view.
                        VStack(alignment: .leading){
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                        
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button{
                  showingAddExpense = true
                }label: {
                   Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddView(expenses: expenses)
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
