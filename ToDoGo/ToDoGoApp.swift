//
//  ToDoGoApp.swift
//  ToDoGo
//
//  Created by Seher Ayesha on 14/02/2024.
//

import SwiftUI

@main
struct ToDoGoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}

