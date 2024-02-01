//
//  ContentView.swift
//  SleepTimer
//
//  Created by Anand on 2/1/24.
//

import SwiftUI

struct AppModeToggle: View {
    @Binding var appMode: AppMode
    @State private var toggleState = true

    var body: some View {
        VStack {
            HStack {
                // Awake timer icon.
                Image(systemName: "cloud")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                // Toggle.
                Toggle("", isOn: $toggleState)
                    .onChange(of: toggleState) { oldValue, newValue in
                        appMode = newValue ? .sleepTimer : .awakeTimer
                    }
                .foregroundColor(.blue)
                .toggleStyle(SwitchToggleStyle(tint:.green))
                
                // Sleep timer icon.
                Image(systemName: "moon")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
            

        }
    }
}
