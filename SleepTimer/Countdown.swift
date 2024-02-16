//
//  ContentView.swift
//  SleepTimer
//
//  Created by Anand on 2/1/24.
//

import SwiftUI

struct Countdown: View {
    @Binding var timerSecs: Int
    @Binding var timerSecsTotal: Int
    @State private var ticker: Timer?
    @State var startEpoch = 0
    @State var fuse = true
    @State var lhs = 0
    @State var rhs = 0
    @State private var interval: TimeInterval = 1.0
    @State private var blink = true

    var body: some View {        
        VStack {
            Text(String(format: "%02d %c %02d", lhs, (blink ? ":" : " ") , rhs)) //timerSecs/60, timerSecs%60))
                .font(Font.system(size: 48))
                .frame(width: 175, height: 80, alignment: .center)
                .environment(\.colorScheme, .dark)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray))
            
            ProgressView(value: 1 - Double(timerSecs)/Double(timerSecsTotal))
                .progressViewStyle(CircularProgressViewStyle())
        }
        .onAppear {
            fuse = true
            startEpoch = Int(Date().timeIntervalSince1970)
            ticker = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                blink.toggle()
                timerSecs = timerSecsTotal - (Int(Date().timeIntervalSince1970) - startEpoch)
            }
        }
        .onDisappear {
            ticker?.invalidate()
            ticker = nil
        }
        .onChange(of: timerSecs, initial: true) { _, new in
            if (timerSecs > 60 * 60) {
                lhs = timerSecs / 3600
                rhs = (timerSecs / 60) % 60
            } else {
                lhs = timerSecs / 60
                rhs = timerSecs % 60
            }
                        
            print("Value changed to: \(new)")
            if (timerSecs <= 0) {
                timerSecs = 0
                ticker?.invalidate()
                ticker = nil
                
                if (fuse) {
                    putMacToSleep()
                }
            }
        }
        .frame(width: 200)
    }
    
    private func putMacToSleep() {
        let appleScript = """
            do shell script "pmset sleepnow"
        """

        fuse = false
        print("Putting mac to Sleep...")
        var error: NSDictionary?
        if let scriptObject = NSAppleScript(source: appleScript) {
            scriptObject.executeAndReturnError(&error)
        }

        if let error = error {
            print("Error putting Mac to sleep: \(error)")
        }
    }
}
