//
//  AppMode.swift
//  SleepTimer
//
//  Created by Anand on 2/1/24.
//

import Foundation

// The app has multiple modes of operation.
// 0 - Set a timer after which to put the device to sleep.
// 2 - Set a timer until which to prevent the device from sleeping.
enum AppMode {
    case sleepTimer
    case awakeTimer
}

