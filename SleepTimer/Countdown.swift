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

    var body: some View {        
        VStack {
            Text(String(format: "%02d : %02d", timerSecs/60, timerSecs%60))
                .font(Font.system(size: 48))
                .frame(width: 175, height: 80, alignment: .center)
                .environment(\.colorScheme, .dark)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray))
            
            ProgressView(value: 1 - Double(timerSecs)/Double(timerSecsTotal))
                .progressViewStyle(CircularProgressViewStyle())
        }
        .onAppear {
            ticker = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                timerSecs -= 1
            }
        }
        .onDisappear {
            ticker?.invalidate()
            ticker = nil
        }
        .frame(width: 200)
    }
}
