//
//  ContentView.swift
//  SleepTimer
//
//  Created by Anand on 2/1/24.
//

import SwiftUI


struct ContentView: View {
    @State var appMode = AppMode.sleepTimer;
    @State var timerRunning = false;
    @State var timerSecs = 15 * 60;
    @State var timerSecsTotal = 15 * 60

    var body: some View {
        ZStack{
            // Background color.
            let backgroundGradient = LinearGradient(
                gradient: Gradient(
                    colors: appMode == .awakeTimer ?
                        [Color.yellow, Color.orange] :
                        [Color.blue, Color.black]),
                startPoint: .top, endPoint: .bottom)
                .animation(.easeOut(duration: 0.8))
    
            backgroundGradient.ignoresSafeArea()
                        
            // Content.
            VStack {
                AppModeToggle(appMode: $appMode)
                
                Spacer()
                
                if (timerRunning) {
                    Countdown(timerSecs: $timerSecs, timerSecsTotal: $timerSecsTotal)
                } else {
                    TimePicker(appMode: $appMode, timerSecs: $timerSecs, timerSecsTotal: $timerSecsTotal)
                }
                
                Spacer()
                
                Divider()
                    .environment(\.colorScheme, (appMode == .awakeTimer) ? .light : .dark)
                
                HStack{
                    Button(timerRunning ? "Stop" : "Start") {
                        if (!timerRunning) {
                            
                        }
                        timerRunning.toggle()
                    }
                    .tint(timerRunning ? .red : .green)
                    .controlSize(.large)
                    .buttonStyle(.borderedProminent)
                    
                    if (timerRunning) {
                        Button("Snooze") {
                            timerSecs += 5 * 60
                            timerSecsTotal += 5 * 60
                        }
                        .tint(.orange)
                        .controlSize(.large)
                        .buttonStyle(.borderedProminent)
                    }
                }
                


            }
            .padding()
        }
    }
}



#Preview {
    ContentView()
}

