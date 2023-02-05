//
//  FinanceApp.swift
//  Finance
//
//  Created by Luka Ivanović on 05.02.2023..
//

import SwiftUI

@main
struct FinanceApp: App {
    // @AppStorage("username") var storage_username = ""
    // @AppStorage("isUser") var storage_isUser = false
    // @StateObject var data = Data()
    // @AppStorage("data") var storage_data = Data()
    
    let dataCoreController = CoreDataStack.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Data())
                .environment(\.managedObjectContext, dataCoreController.persistentContainer.viewContext)
        }
    }
}
