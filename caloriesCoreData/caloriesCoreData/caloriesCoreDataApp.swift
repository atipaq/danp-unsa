//
//  caloriesCoreDataApp.swift
//  caloriesCoreData
//
//  Created by Alex Huaracha on 10/10/24.
//

import SwiftUI

@main
struct caloriesCoreDataApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              dataController.container.viewContext)
        }
    }
}
