//
//  AppTodoView.swift
//  Todo App
//
//  Created by Abdul Halim on 15/02/21.
//  Copyright © 2021 NEONFACT. All rights reserved.
//

import SwiftUI

struct AddTodoView: View {
    
    @Environment(\.presentationMode) var presentaionMode
    @State private var name : String = ""
    @State private var priority : String = ""
    
    let priorities = ["High", "Normal", "Low"]
    
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    TextField("Todo", text: $name)
                    
                    Picker("Priority", selection: $priority){
                        ForEach(priorities, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    Button(
                        action : {print("Save a new todo item")
                    }){
                        Text("Save")
                    }
                }
                Spacer()
            }
            .navigationBarTitle("New Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action : {
                    self.presentaionMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "xmark")
                })
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
