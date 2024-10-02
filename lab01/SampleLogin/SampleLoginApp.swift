//
//  SampleLoginApp.swift
//  SampleLogin
//
//  Created by Alex Huaracha on 25/09/24.
//

import SwiftUI

@main
struct SampleLoginApp: App {
    
    @State var isLoggedin:Bool = false
    
    var body: some Scene {
        WindowGroup {
            // ContentView()
            if isLoggedin {
                HomeView()
            } else {
                LoginView(isLoggedin: $isLoggedin)
            }
        }
    }
}
