//
//  AddView.swift
//  ExpensesTracker
//
//  Created by Buhle Radzilani on 2024/06/11.
//

import SwiftUI

struct AddView: View {
    
    //We are using the @ObservedObject because at this point the object is already created in the content view
    //In content view we are creating the object so we use the @Stateobject
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let  types = ["Business", "Personal"]
    
    var body: some View {
    
        NavigationView{
            Form{
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
        TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                }
            .navigationTitle("Add new expense")
            }
            
        }
                
           
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
