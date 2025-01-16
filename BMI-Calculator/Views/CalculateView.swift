//
//  CalculateView.swift
//  Bmicalculator
//
//  Created by Arthur Coelho on 31/07/24.
//

import UIKit

protocol CalculateViewProtocol: AnyObject {
	func tappedCalculateButton()
}

class CalculateView: UIView {
		
	private weak var delegate: CalculateViewProtocol?
		
	public func delegate(delegate: CalculateViewProtocol?) {
		self.delegate = delegate
	}
	
	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.image = UIImage(named: "calculate_background")
		return imageView
		}()
	
	lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.alignment = .leading
		stackView.spacing = 10
		return stackView
		}()
	
	lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .darkGray
		label.textAlignment = .left
		label.font = UIFont.boldSystemFont(ofSize: 40)
		label.text = "Calcule seu IMC"
		return label
	}()

	lazy var firstStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .horizontal
		stackView.distribution = .fill
		stackView.alignment = .center
		stackView.spacing = 10
		return stackView
	}()
		
	lazy var height: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .darkGray
		label.font = UIFont.systemFont(ofSize: 18)
		label.text = "Altura"
		return label
	}()
	
	lazy var heightLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .darkGray
		label.font = UIFont.systemFont(ofSize: 18)
		label.text = "1.50 m"
		return label
	}()
	
	lazy var heightSlider: UISlider = {
		let slider = UISlider()
		slider.translatesAutoresizingMaskIntoConstraints = false
		slider.minimumValue = 0
		slider.maximumValue = 2.2
		slider.value = 1.5
		slider.addTarget(self, action: #selector(heightSliderChanged(_:)), for: .valueChanged)
		return slider
	}()
	
	lazy var secondStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .horizontal
		stackView.distribution = .fill
		stackView.alignment = .center
		stackView.spacing = 10
		return stackView
	}()
		
	lazy var weight: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .darkGray
		label.font = UIFont.systemFont(ofSize: 18)
		label.text = "Peso"
		return label
	}()
		
	lazy var weightLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .darkGray
		label.font = UIFont.systemFont(ofSize: 18)
		label.text = "70 kg"
		return label
	}()
		
	lazy var weightSlider: UISlider = {
		let slider = UISlider()
		slider.translatesAutoresizingMaskIntoConstraints = false
		slider.minimumValue = 30
		slider.maximumValue = 200
		slider.value = 70
		slider.addTarget(self, action: #selector(weightSliderChanged(_:)), for: .valueChanged)
		return slider
	}()
	
	lazy var calculateButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Calcular IMC", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
		button.setTitleColor(.white, for: .normal)
		button.isEnabled = true
		button.clipsToBounds = true
		button.backgroundColor = UIColor(red: 98/255, green: 96/255, blue: 157/255, alpha: 1.0)
		button.layer.cornerRadius = 7.5
		button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
		return button
	}()
	
	@objc func tappedCalculateButton(_ sender: UIButton) {		
		delegate?.tappedCalculateButton()
	}
	
	@objc func heightSliderChanged(_ sender: UISlider) {
		let height = String(format: "%.2f", sender.value)
		heightLabel.text = "\(height) m"
	}

	@objc func weightSliderChanged(_ sender: UISlider) {
		let weight = String(format: "%.0f", sender.value)
		weightLabel.text = "\(weight) kg"
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		heightLabel.text = "\(String(format: "%.2f", heightSlider.value)) m"
		weightLabel.text = "\(String(format: "%.0f", weightSlider.value)) kg"
		
		addElements()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addElements() {
		self.addSubview(backgroundImageView)
		stackView.addArrangedSubview(titleLabel)
		stackView.addArrangedSubview(firstStackView)
		stackView.addArrangedSubview(heightSlider)
		stackView.addArrangedSubview(secondStackView)
		stackView.addArrangedSubview(weightSlider)
		stackView.addArrangedSubview(calculateButton)
		firstStackView.addArrangedSubview(height)
		firstStackView.addArrangedSubview(UIView())
		firstStackView.addArrangedSubview(heightLabel)
		secondStackView.addArrangedSubview(weight)
		secondStackView.addArrangedSubview(UIView())
		secondStackView.addArrangedSubview(weightLabel)
		self.addSubview(stackView)
	}
	
	func configConstraints() {
		NSLayoutConstraint.activate([
			backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
			backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
			backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
			stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
			
			titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
			titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
			
			firstStackView.heightAnchor.constraint(equalToConstant: 21),
			firstStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
			firstStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
						
			heightSlider.heightAnchor.constraint(equalToConstant: 60),
			heightSlider.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
			heightSlider.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
						
			secondStackView.heightAnchor.constraint(equalToConstant: 21),
			secondStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
			secondStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
						
			weightSlider.heightAnchor.constraint(equalToConstant: 60),
			weightSlider.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
			weightSlider.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -20),
			
			calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			calculateButton.heightAnchor.constraint(equalToConstant: 45)
		])
	}
}
