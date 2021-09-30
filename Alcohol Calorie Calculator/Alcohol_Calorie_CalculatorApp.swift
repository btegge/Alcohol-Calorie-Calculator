//
//  Alcohol_Calorie_CalculatorApp.swift
//  Alcohol Calorie Calculator
//
//  Created by Benjamin Tegge on 4/8/21.
//

import SwiftUI

@main
struct Alcohol_Calorie_CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(calories: "", abv: "", volume: "", aType: 0)
        }
    }
}
