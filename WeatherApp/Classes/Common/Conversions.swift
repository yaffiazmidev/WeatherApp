//
//  Conversions.swift
//  WeatherApp
//
//  Created by Yaffi Azmi on 17/01/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import UIKit

class Conversions {
    
    static func convertTemp(temp: Double, from inputTempType: UnitTemperature, to outputTempType: UnitTemperature) -> String {
       let mf = MeasurementFormatter()
       mf.numberFormatter.maximumFractionDigits = 0
       mf.unitOptions = .providedUnit
       let input = Measurement(value: temp, unit: inputTempType)
       let output = input.converted(to: outputTempType)
       return mf.string(from: output)
     }
    
    
}
