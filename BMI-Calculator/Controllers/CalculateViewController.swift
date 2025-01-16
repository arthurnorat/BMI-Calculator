//
//  CalculateViewController.swift
//  Bmicalculator
//
//  Created by Arthur Coelho on 31/07/24.
//

import UIKit

class CalculateViewController: UIViewController {
	
	var calculateView: CalculateView?
	var calculatorBrain = CalculatorBrain()
	
	// Estudar ciclo de vida
	override func loadView() {
		calculateView = CalculateView()
		view = calculateView
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		calculateView?.delegate(delegate: self)        
    }
}

extension CalculateViewController: CalculateViewProtocol {
	func tappedCalculateButton() {
		// 1. Captura o valor dos sliders
		let height = calculateView?.heightSlider.value ?? 1.50
		let weight = calculateView?.weightSlider.value ?? 70.0
		
		// 2. Passa os valores para CalculatorBrain calcular o IMC
		calculatorBrain.calculateBMI(height: height, weight: weight)
		
		// 3. Passa os valores para ResultViewController
		let resultVC = ResultViewController()
		
		resultVC.bmiValue = calculatorBrain.getBMIValue()
		resultVC.advice = calculatorBrain.getAdvice()
		resultVC.color = calculatorBrain.getColor()	
		
		// 4. Apresenta a ResultViewController
		present(resultVC, animated: true)
	}
}
