//
//  CalculatorBrain.swift
//  Bmicalculator
//
//  Created by Arthur Coelho on 31/07/24.
//

import Foundation
import UIKit

struct CalculatorBrain {
	
	var bmi: BMI?
	
	func getBMIValue() -> String {
		let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
		return bmiTo1DecimalPlace
	}
	
	func getAdvice() -> String {
		return bmi?.advice ?? "No advice"
	}
	
	func getColor() -> UIColor {
		return bmi?.color ?? UIColor.white
	}
	
	mutating func calculateBMI(height: Float, weight: Float) {
		let bmiValue = weight / pow(height, 2)
		
		if bmiValue < 18.5 {
			bmi = BMI(value: bmiValue, advice: "IMC abaixo do ideal", color: UIColor.systemBlue)
		} else if bmiValue < 24.9 {
			bmi = BMI(value: bmiValue, advice: "IMC ideal", color: UIColor.systemGreen)
		} else {
			bmi = BMI(value: bmiValue, advice: "IMC acima do ideal", color: UIColor.systemRed)
		}
	}
}
