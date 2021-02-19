//
//  ContentView.swift
//  Todo App
//
//  Created by Abdul Halim on 15/02/21.
//  Copyright © 2021 NEONFACT. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos : FetchedResults<Todo>
    
    @State private var showingAddTodoView : Bool = false
    
    var body: some View {
        NavigationView{
            ZStack{
                List{
                    ForEach(self.todos, id : \.self){ todo in
                        HStack{
                            Text(todo.name ?? "Unkown")
                            
                            Spacer()
                            
                            Text(todo.priority ?? "Unkown" )
                        }
                    }
                    .onDelete(perform :deleteTodo)
                }
                .navigationBarTitle("Catatan", displayMode: .inline)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                    Button(action : {
                        self.showingAddTodoView.toggle()
                    }){
                        Image(systemName: "plus.circle.fill")
                    }
                    .sheet(isPresented: $showingAddTodoView){
                        AddTodoView().environment(\.managedObjectContext, self.managedObjectContext )
                })
                
                if todos.count == 0 {
                    EmptyListViews()
                }
            }.sheet(isPresented: $showingAddTodoView){
                AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
            }
            .overlay(
                ZStack{
                    Button(action : {
                        self.showingAddTodoView.toggle()
                    }){
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width : 48, height: 48, alignment: .center)
                    }
                }
                .padding(.bottom, 15)
                .padding(.trailing, 15)
                , alignment: .bottomTrailing
            )
        }
    }
    
    private func deleteTodo(at offset : IndexSet){
        for index in offset {
            let todo = todos[index]
            
            managedObjectContext.delete(todo)
            
            do{
                try managedObjectContext.save()
            }catch{
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return ContentView()
            .environment(\.managedObjectContext, context)
        
    }
}
