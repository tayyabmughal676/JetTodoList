//
//  JetTodoListApp.swift
//  JetTodoList
//
//  Created by Thor on 13/07/2021.
//

import SwiftUI

@main
struct JetTodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
