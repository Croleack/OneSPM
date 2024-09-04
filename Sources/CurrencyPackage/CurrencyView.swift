//
//  File.swift
//  
//
//  Created by test on 04.09.2024.
//

import UIKit

class CurrencyView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Рубли по стандарту ISO 4217"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isEditable = false
        return textView
    }()
    
    private let currencyService = CurrencyService()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        fetchCurrencyData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        fetchCurrencyData()
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(textView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    private func fetchCurrencyData() {
        currencyService.fetchCurrencies { [weak self] result in
            switch result {
            case .success(let currencies):
                let text = currencies.map { "\($0.name) (\($0.strcode)) - \($0.country)" }.joined(separator: "\n")
                DispatchQueue.main.async {
                    self?.textView.text = text
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.textView.text = "Ошибка загрузки данных: \(error.localizedDescription)"
                }
            }
        }
    }
}
