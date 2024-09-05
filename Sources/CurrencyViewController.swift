//
//  CurrencyViewController.swift
//
//
//  Created by test on 05.09.2024.
//

import UIKit

public final class CurrencyViewController: UIViewController {
    //MARK: - Variables
    private let currencyView = CurrencyView()
    private let ipManager = IPManager()

    // MARK: - viewDidLoad
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        fetchIPData()
    }
    
    // MARK: - functions
    private func fetchIPData() {
        let currencyService = CurrencyService()

        Task {
            do {
                let ip = try await currencyService.fetchIP()
                await ipManager.updateIP(ip)
                
                await MainActor.run { [weak self] in
                    self?.title = "Твой IP: \(ip)"
                }
            } catch {
                await MainActor.run { [weak self] in
                    self?.title = "Ошибка: \(error.localizedDescription)"
                }
            }
        }
    }
}
