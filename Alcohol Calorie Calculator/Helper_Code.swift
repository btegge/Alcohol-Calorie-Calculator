//
//  Calculator_Logic.swift
//  Alcohol Calorie Calculator
//
//  Created by Benjamin Tegge on 4/8/21.
//

import Foundation

func VolumeCheck(volText: String) -> Double {
    let volumeSanitized: String = volText.filter("0123456789.".contains)
    var volume: Double = Double(volumeSanitized)!
    if volume < 0 {
        volume = 0
    }
    return volume
}

func AbvCheck(abvText: String) -> Double {
    let abvSanitized: String = abvText.filter("0123456789.".contains)
    var abv: Double = Double(abvSanitized)! / 100
    if abv < 0 {
        abv = 0
    } else if abv > 1 {
        abv = 1
    }
    return abv
}

func Calorie_Calculation(alcType: Int, abv: Double, vol: Double) -> String {
    // alcType: 0 = Liquor; 1 = Beer; 2 = Wine
    // abv: assumed to be 0 to 1
    // vol: assumed to be ounces
    
    var calorieMult: Double //kCal/oz
    
    switch alcType {
    case 0:
        calorieMult = 163.3355
    case 1:
        calorieMult = 250
    case 2:
        calorieMult = 160
    default:
        calorieMult = 0
    }
    
    return String(round(abv * vol * calorieMult))
}
