//
//  PromoNavigator.swift
//  Test_Qris_BNI
//
//  Created by Yanandra Dhafa on 14/03/24.
//

import Foundation

import UIKit

protocol PromoNavigator {
  func navigateToPromo(from viewController: UIViewController)
    func navigateToDetailPromo(from viewController: UIViewController, url : String)
}

struct DefaultPromoNavigator: PromoNavigator {
  private let assembler: Assembler

  init(assembler: Assembler) {
    self.assembler = assembler
  }

  func navigateToPromo(from viewController: UIViewController) {
    let nextViewController: PromoViewController = assembler.resolve()
    viewController.navigationController?.pushViewController(nextViewController, animated: true)
      
  }

    func navigateToDetailPromo(from viewController: UIViewController, url : String) {
      let nextViewController: PromoDetailViewController = assembler.resolve(url: url)
      viewController.navigationController?.pushViewController(nextViewController, animated: true)
  }
}
