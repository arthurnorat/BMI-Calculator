//
//  ResultView.swift
//  Bmicalculator
//
//  Created by Arthur Coelho on 31/07/24.
//

import UIKit

class ResultView: UIView {
	
	lazy var backgroundImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.image = UIImage(named: "result_background")
		return imageView
	}()
	
	lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.distribution = .equalSpacing
		stackView.alignment = .center
		stackView.spacing = 20
		return stackView
	}()
	
	lazy var yourResultLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .white
		label.textAlignment = .center
		label.font = UIFont.boldSystemFont(ofSize: 35)
		label.text = "Seu Resultado"
		return label
	}()
	
	lazy var BMILabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .white
		label.textAlignment = .center
		label.font = UIFont.boldSystemFont(ofSize: 80)
		label.text = "19.5"
		return label
	}()
	
	lazy var adviceLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .white
		label.textAlignment = .center
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.text = "Recomendação"
		return label
	}()
	
	lazy var recalculateButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Recalcular", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
		button.setTitleColor(UIColor(red: 98/255, green: 96/255, blue: 157/255, alpha: 1.0), for: .normal)
		button.isEnabled = true
		button.clipsToBounds = true
		button.backgroundColor = .white
		button.layer.cornerRadius = 7.5
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addElements()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func addElements() {
		self.addSubview(backgroundImageView)
		stackView.addArrangedSubview(yourResultLabel)
		stackView.addArrangedSubview(BMILabel)
		stackView.addArrangedSubview(adviceLabel)
		self.addSubview(recalculateButton)
		self.addSubview(stackView)
	}
	
	func configConstraints() {
		NSLayoutConstraint.activate([
			backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
			backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
			backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
			stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),			
			
			recalculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 20),
			recalculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			recalculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			recalculateButton.heightAnchor.constraint(equalToConstant: 45)
		])
	}
}
