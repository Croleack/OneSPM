//
//  File.swift
//  
//
//  Created by test on 04.09.2024.
//

import UIKit

public class CurrencyView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш текущий IP-адрес"
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
        fetchIPData()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        fetchIPData()
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(textView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    private func fetchIPData() {
        currencyService.fetchIP { [weak self] result in
            switch result {
            case .success(let ip):
                DispatchQueue.main.async {
                    self?.textView.text = "Ваш IP: \(ip)"
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.textView.text = "Ошибка загрузки IP: \(error.localizedDescription)"
                }
            }
        }
    }
}
