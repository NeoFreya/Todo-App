//
//  ContentView.swift
//  Todo App
//
//  Created by Abdul Halim on 15/02/21.
//  Copyright © 2021 NEONFACT. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddTodoView : Bool = false
    var body: some View {
        NavigationView{
            List(0..<5){item in
                Text("Hello World")
            }.navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action : {
                    self.showingAddTodoView.toggle()
                }){
                    Image(systemName: "plus.circle.fill")
                }
                .sheet(isPresented: $showingAddTodoView){
                    AddTodoView()
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
