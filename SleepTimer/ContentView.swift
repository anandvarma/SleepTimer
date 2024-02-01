//
//  ContentView.swift
//  SleepTimer
//
//  Created by Anand on 2/1/24.
//

import SwiftUI


struct ContentView: View {
    @State var appMode = AppMode.sleepTimer;

    var body: some View {
        ZStack{
            // Background color.
            let backgroundGradient =
            appMode == .awakeTimer ?
            LinearGradient(
                gradient: Gradient(colors: [Color.yellow, Color.orange]),
                startPoint: .top, endPoint: .bottom) :
            LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.black]),
                startPoint: .top, endPoint: .bottom)
            backgroundGradient.ignoresSafeArea()
            
            // Content.
            VStack {
                AppModeToggle(appMode: $appMode)
                
                Spacer()
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                Spacer()
                
                Button(action: {
                    NSApplication.shared.terminate(self)
                })
                {
                    let buttonLabel = appMode == .awakeTimer ?
                        "Stay Awake!" : "Schedule Sleep!"
                    Text(buttonLabel)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .padding(.trailing, 0.0)
                .frame(width: 360.0, alignment: .trailing)
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

