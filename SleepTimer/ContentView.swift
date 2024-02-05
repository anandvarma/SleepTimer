//
//  ContentView.swift
//  SleepTimer
//
//  Created by Anand on 2/1/24.
//

import SwiftUI


struct ContentView: View {
    @State var appMode = AppMode.sleepTimer;
    @State private var toggleState = false
    @State private var input: String = ""
    @State private var selectedUnit = 0 // 0 represents "Minutes", 1 represents "Hours"


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
                
                TextField("15", text: self.$input)
                    .font(Font.system(size: 48.0))
                    .frame(width: 58, height: 80, alignment: .center)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 10)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray))

                Picker("", selection: $selectedUnit) {
                    Text("Minutes").tag(0)
                    Text("Hours").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .frame(width: 120)
                
                Spacer()
                
                //LinearProgressDemoView()
            }
            .padding()
        }
    }
}

struct LinearProgressDemoView: View {
    @State private var progress = 0.0

    var body: some View {
        VStack {
            ProgressView(value: progress)
            Button("Start!") { progress += 0.05 }
        }
    }
}

#Preview {
    ContentView()
}

