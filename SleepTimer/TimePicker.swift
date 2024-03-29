//
//  ContentView.swift
//  SleepTimer
//
//  Created by Anand on 2/1/24.
//

import SwiftUI

struct TimePicker: View {
    @Binding var appMode: AppMode
    @Binding var pickerValue: Int
    @Binding var pickerUnit: Int

    var body: some View {
        VStack {
            Stepper("\(pickerValue)",
                    onIncrement: {
                        pickerValue += 1
                    },
                    onDecrement: {
                        pickerValue -= 1
                    },
                onEditingChanged: { changed in })
            .font(Font.system(size: 48))
            .frame(width: 90, height: 80, alignment: .center)
            .padding([.horizontal], 10)
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray))
            .environment(\.colorScheme, (appMode == .awakeTimer) ? .light : .dark)

            Picker("", selection: $pickerUnit) {
                Text("Minutes").tag(60)
                Text("Hours").tag(3600)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .frame(width: 120)
            .environment(\.colorScheme, (appMode == .awakeTimer) ? .light : .dark)
        }
        .frame(width: 200)
    }
}
