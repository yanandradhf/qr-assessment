//
//  TransactionNavigator.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import Foundation

import UIKit

protocol TransactionNavigator {
  func navigateToPayment(from viewController: UIViewController)
  func navigateToHistoryPayment(from viewController: UIViewController)
}

struct DefaultTransactionNavigator: TransactionNavigator {
  private let assembler: Assembler

  init(assembler: Assembler) {
    self.assembler = assembler
  }

  func navigateToPayment(from viewController: UIViewController) {

    let nextViewController: PaymentViewController = assembler.resolve()
    viewController.navigationController?.pushViewController(nextViewController, animated: true)
     
  }

  func navigateToHistoryPayment(from viewController: UIViewController) {
      let nextViewController: HistoryPaymentViewController = assembler.resolve()
      viewController.navigationController?.pushViewController(nextViewController, animated: true)
  }
}
