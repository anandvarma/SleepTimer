//
//  ContentView.swift
//  SleepTimer
//
//  Created by Anand on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    // Global state.
    @State var appMode = AppMode.sleepTimer
    
    // Time picker state.
    @State var pickerValue = 15 //15
    @State var pickerUnit = 60 //60

    // Coundown state.
    @State var timerRunning = false
    @State var timerSecs = 0
    @State var timerSecsTotal = 0

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
                    TimePicker(appMode: $appMode, pickerValue: $pickerValue, pickerUnit: $pickerUnit)
                }
                
                Spacer()
                
                Divider()
                    .environment(\.colorScheme, (appMode == .awakeTimer) ? .light : .dark)
                
                HStack{
                    Button(timerRunning ? "Stop" : "Start") {
                        if (timerRunning) {
                            // Stop.
                            //timerSecs = 0
                            //timerSecsTotal = 0
                        } else {
                            // Start.
                            timerSecs = pickerValue * pickerUnit
                            timerSecsTotal = timerSecs
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
                            //endEpoch += 5 * 60
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

