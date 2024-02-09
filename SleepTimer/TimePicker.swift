//
//  ContentView.swift
//  SleepTimer
//
//  Created by Anand on 2/1/24.
//

import SwiftUI

struct TimePicker: View {
    @Binding var appMode: AppMode
    @Binding var timerSecs: Int
    @Binding var timerSecsTotal: Int

    @State private var selectedUnit = 0 // 0 represents "Minutes", 1 represents "Hours"


    var body: some View {
        VStack {
            Stepper("\(timerSecs/60)",
                    onIncrement: {
                        timerSecs += 1 * (selectedUnit == 0 ? 60 : 3600);
                        timerSecsTotal = timerSecs
                    },
                    onDecrement: {
                        timerSecs -= 1 * (selectedUnit == 0 ? 60 : 3600);
                        timerSecsTotal = timerSecs
                    },
                onEditingChanged: { changed in })
            .font(Font.system(size: 48))
            .frame(width: 90, height: 80, alignment: .center)
            .padding([.horizontal], 10)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray))
            .environment(\.colorScheme, (appMode == .awakeTimer) ? .light : .dark)

            Picker("", selection: $selectedUnit) {
                Text("Minutes").tag(0)
                Text("Hours").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .frame(width: 120)
            .environment(\.colorScheme, (appMode == .awakeTimer) ? .light : .dark)
        }
        .frame(width: 200)
    }
}
