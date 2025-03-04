//
//  ContentView.swift
//  Todoey
//
//  Created by Jahaziel Herberth Martinez on 3/3/25.
//

import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var item: String
    var isDone: Bool
}

struct ContentView: View {
    @State private var todos: [Todo] = []
    @State private var newTodo: String = ""
    var body: some View {
        VStack {
                Text("ToDoList")
                    .font(.title)
                    .padding()
                    .fontWeight(.heavy)
                
                Button{
                    AddTask()
                    
                }label: {
                    HStack{
                        Image(systemName: "plus.circle")
                        Text("Add new task")
                        
                    }
                    .foregroundStyle(.gray)
                }
                
                List {
                    ForEach($todos) { $todo in
                        // access a specific Todo object using 'todo'
                        // i.e. todo.isDone.toggle()
                        HStack {
                            TextField("Enter new task", text: $todo.item)
                                .foregroundColor(todo.isDone ? .black : .gray)
                            
                            Button{
                                todo.isDone.toggle()
                            }label: {
                                Image(systemName:  todo.isDone ? "circle" : "circle.fill")
                            }
                        }
                    }
                    .onDelete(perform: removeTask)
                }
                .listStyle(.inset)
        
            }
    
        }
        private func AddTask(){
            let newTask = Todo(item: newTodo,  isDone: true)
            todos.append(newTask)
        }
    private func removeTask(at offsets: IndexSet){
        todos.remove(atOffsets: offsets)
    }
    }



#Preview {
    ContentView()
}
