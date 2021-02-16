//
//  AppTodoView.swift
//  Todo App
//
//  Created by Abdul Halim on 15/02/21.
//  Copyright © 2021 NEONFACT. All rights reserved.
//

import SwiftUI

struct AddTodoView: View {
    
    @Environment(\.managedObjectContext) var manageObjectContext
    @Environment(\.presentationMode) var presentaionMode
    
    @State private var name : String = ""
    @State private var priority : String = ""
    
    let priorities = ["High", "Normal", "Low"]
    
    @State private var errorShowing : Bool = false
    @State private var errorTitle : String = ""
    @State private var errorMessage : String = ""
    
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
                    
                    Button(action :{
                                if self.name != "" {
                                let todo = Todo(context: self.manageObjectContext)
                                todo.name = self.name
                                todo.priority = self.priority
                            
                            do{
                                try self.manageObjectContext.save()
                                print("New todo : \(todo.name ?? ""), Priority: \(todo.priority ?? "")"  )
                            }catch {
                                print(error)
                            }
                            }else{
                                self.errorShowing = true
                                self.errorTitle = "Invalid Name"
                                self.errorMessage = "Make Sure to enter something for\nthe new todo item"
                                return
                            }
                                self.presentaionMode.wrappedValue.dismiss()
                            
                    }){
                        Text("Save")
                    }
                }
                Spacer()
            }
            .navigationBarTitle("New Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action : {
                    
                }){
                    Image(systemName: "xmark")
            })
                .alert(isPresented: $errorShowing){
                    Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")) )
            }
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
