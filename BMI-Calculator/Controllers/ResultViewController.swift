//
//  ResultViewController.swift
//  Bmicalculator
//
//  Created by Arthur Coelho on 31/07/24.
//

import UIKit

class ResultViewController: UIViewController {
	
	var resultView: ResultView?
	
	var bmiValue: String?
	var advice: String?
	var color: UIColor?
	
	override func loadView() {
		resultView = ResultView()
		view = resultView
		resultView?.recalculateButton.addTarget(self, action: #selector(tappedRecalculateButton), for: .touchUpInside)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		resultView?.BMILabel.text = bmiValue
		resultView?.adviceLabel.text = advice
		view.backgroundColor = color
    }
	
	@objc func tappedRecalculateButton(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
	}
}
