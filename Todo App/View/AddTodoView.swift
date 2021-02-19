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
                VStack(alignment : .leading, spacing: 20){
                    TextField("Todo", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size : 24, weight : .bold, design : .default ))
                    
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
                            .font(.system(size : 24, weight :.bold, design : .default ))
                            .padding()
                            .frame(minWidth : 0, maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(9)
                            .foregroundColor(Color.white)
                        
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 30)
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
