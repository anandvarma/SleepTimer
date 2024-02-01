//
//  SleepTimerApp.swift
//  SleepTimer
//
//  Created by Anand on 2/1/24.
//

import SwiftUI

@main
struct SleepTimerApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Hide the title bar, let background color fill the window.
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
