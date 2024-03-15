//
//  TransactionAssembler.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import Foundation

protocol TransactionAssembler {
  func resolve() -> TransactionNavigator
 
  func resolve() -> PaymentViewController
  func resolve() -> HistoryPaymentViewController

}

extension TransactionAssembler where Self: Assembler {
  func resolve() -> TransactionNavigator {
    return DefaultTransactionNavigator(assembler: self)
  }

  func resolve() -> PaymentViewController {
      return PaymentViewController()
  }
    func resolve() -> HistoryPaymentViewController {
        return HistoryPaymentViewController()
    }

}

