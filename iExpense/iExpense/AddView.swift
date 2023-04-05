//
//  AddView.swift
//  iExpense
//
//  Created by Mohammed Mubashir on 02/04/23.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var expenses : Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business","Personal"]
    
    var body: some View {
        NavigationView{
        Form{
            TextField("Name",text: $name) 
            Picker("Type of expense", selection: $type) {
                ForEach(types,id: \.self){
                    exType in
                    Text(exType)
                }
            }
           TextField("Amount",value: $amount, format: .currency(code: "INR"))
                    .keyboardType(.numberPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
