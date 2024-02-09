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
                    .scaleEffect(1.75)
                    .padding(10)
                    .opacity(!toggleState ? 1 : 0.5)
                    .fontWeight(!toggleState ? .bold : .regular)
                    .help("Keep the mac awake.")
                
                Spacer()
                
                // Toggle.
                Toggle("", isOn: $toggleState)
                    .onChange(of: toggleState) { oldValue, newValue in
                        appMode = newValue ? .sleepTimer : .awakeTimer
                    }
                .foregroundColor(.blue)
                .toggleStyle(SwitchToggleStyle(tint:.green))
                .scaleEffect(1.5)
                
                Spacer()
                
                // Sleep timer icon.
                Image(systemName: "moon")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .scaleEffect(1.75)
                    .padding(20)
                    .opacity(toggleState ? 1 : 0.5)
                    .fontWeight(toggleState ? .bold : .regular)
                    .help("Put the mac to sleep.")
            }
        }
        .frame(width: 200)
    }
}
